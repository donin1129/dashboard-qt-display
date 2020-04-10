#include "candrv.h"

#include <QDebug>

CanDrv::CanDrv(QObject *parent) : QObject(parent)
{
    QString errorString;
    m_canDevice = QCanBus::instance()->createDevice(
        QStringLiteral("socketcan"), QStringLiteral("can1"), &errorString);
    if (!m_canDevice) {
        // Error handling goes here
        while(1);
    } else {

        // TODO: add CAN filter

        connect(m_canDevice, &QCanBusDevice::framesReceived, this, &CanDrv::processReceivedFrames);

        m_canDevice->connectDevice();
    }

    m_canData = {};
    m_canData.engineWaterTemperature = (double)0;
}

canData_t CanDrv::readCanData()
{
    return m_canData;
}

void CanDrv::processReceivedFrames()
{
    if (!m_canDevice)
        return;

    while (m_canDevice->framesAvailable()) {
        const QCanBusFrame frame = m_canDevice->readFrame();

        QString view;
        if (frame.frameType() == QCanBusFrame::ErrorFrame)
            view = m_canDevice->interpretErrorFrame(frame);
        else
            view = frame.toString();

        const QString time = QString::fromLatin1("%1.%2  ")
                .arg(frame.timeStamp().seconds(), 10, 10, QLatin1Char(' '))
                .arg(frame.timeStamp().microSeconds() / 100, 4, 10, QLatin1Char('0'));

        qDebug() << view;

        switch(frame.frameId()) {
        case FRAME_DATA_1:
            m_canData.engineWaterTemperature = (double)frame.payload()[0] / 2;
            m_canData.engineOilTemperature = (double)frame.payload()[1] / 2 - 10;
            m_canData.ambientTemperature = (double)frame.payload()[2] / 2 - 50;
            m_canData.airboxTemperature = (double)frame.payload()[3] / 2 - 50;
            m_canData.fuelTemperature = (double)frame.payload()[4] / 4;
            m_canData.batteryVoltage = (double)frame.payload()[5] / 20 + 6;
            m_canData.ambientPressure = (double)frame.payload()[6] / 4 + 80;
            break;
        case FRAME_DATA_2:
            break;
        case FRAME_DATA_3:
            break;
        case FRAME_DATA_4:
            break;
        case FRAME_DATA_5:
            break;
        default:
            break;
        }

        emit newCanData();
    }
}

void CanDrv::mockCanData() {
    //qDebug() << "Test";

    if(m_canData.engineSpeed <= 11000){
        m_canData.engineSpeed += 100;
    }else{
        m_canData.engineSpeed = 0;
    }


    qDebug() << "mockCanData: " << m_canData.engineSpeed;

    emit newCanData();
}
