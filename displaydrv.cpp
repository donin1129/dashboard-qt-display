#include "displaydrv.h"

#include <QDebug>

DisplayDrv::DisplayDrv(QObject *parent) : QObject(parent)
{
    m_canData = {};
    m_displayData.gear = "N";
    m_displayData.grid = {
        0, // 0-Water Temp
        0, // 1-Oil Temp
        0, // 2-Amb Temp
        0, // 3-Airbox Temp
        0, // 4-Fuel Temp
        0, // 5-Oil Pres
        0, // 6-Amb Pres
        0, // 7-Fuel Pres
        0, // 8-Brake Pres (R)
        0, // 9-Brake Pres (L)
        0, // 10-steeringAngle
        0, // 11-engineSpeed
        0, // 12-throttlePosition;
        0, // 13-batteryVoltage;
        0  // 14-displaySetting;
    };
}

displayData_t DisplayDrv::readDisplayData()
{
    return m_displayData;
}

displayLabels_t DisplayDrv::readDisplayLabels()
{
    return m_displayLabels;
}


void DisplayDrv::setCanData(canData_t canData)
{
    m_canData = canData;

    m_displayData.grid[0] = m_canData.engineWaterTemperature;
    m_displayData.grid[1] = m_canData.engineOilTemperature;
    m_displayData.grid[2] = m_canData.ambientTemperature;
    m_displayData.grid[3] = m_canData.airboxTemperature;
    m_displayData.grid[4] = m_canData.fuelTemperature;
    m_displayData.grid[5] = m_canData.engineOilPressure;
    m_displayData.grid[6] = m_canData.ambientPressure;
    m_displayData.grid[7] = m_canData.fuelPressure;
    m_displayData.grid[8] = m_canData.brakePressureRight;
    m_displayData.grid[9] = m_canData.brakePressureLeft;
    m_displayData.grid[10] = m_canData.steeringAngle;
    m_displayData.grid[11] = m_canData.engineSpeed;
    m_displayData.grid[12] = m_canData.throttlePosition;
    m_displayData.grid[13] = m_canData.batteryVoltage;
    //m_displayData.grid[14] = m_canData.displaySetting;
    m_displayData.grid[14] = 0;

    qDebug() << "setCanData: " << m_displayData.grid[11];

    emit newDisplayData();
}
