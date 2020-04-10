#ifndef CANDRV_H
#define CANDRV_H

#include <QObject>

#include <QtSerialBus/QCanBus>

#define FRAME_DATA_1    0x100
#define FRAME_DATA_2    0x101
#define FRAME_DATA_3    0x102
#define FRAME_DATA_4    0x103
#define FRAME_DATA_5    0x104

struct canData_t{
    Q_GADGET
public:
    double brakePressureRight;
    double brakePressureLeft;
    unsigned gear;
    int steeringAngle;
    unsigned engineSpeed;
    double fuelPressure;
    double engineOilPressure;
    double throttlePosition;
    double ambientPressure;
    double batteryVoltage;
    double fuelTemperature;
    double airboxTemperature;
    double ambientTemperature;
    double engineOilTemperature;
    double engineWaterTemperature;
    unsigned displaySetting;
    Q_PROPERTY(int steeringAngle MEMBER steeringAngle)
};

Q_DECLARE_METATYPE(canData_t)

class CanDrv : public QObject
{
    Q_OBJECT
    Q_PROPERTY(canData_t canData READ readCanData NOTIFY newCanData)

public:
    explicit CanDrv(QObject *parent = nullptr);
    canData_t readCanData();

private:
    canData_t m_canData;
    QCanBusDevice *m_canDevice;

signals:
    void newCanData();

public slots:
    void mockCanData();

private slots:
    void processReceivedFrames();
};

#endif // CANDRV_H
