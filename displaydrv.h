#ifndef DISPLAYDRV_H
#define DISPLAYDRV_H

#include <QObject>
#include <QVector>
#include "candrv.h"

#define GRID_SIZE   8

struct displayData_t{
    Q_GADGET
public:
    QList<qreal> grid;
    QString gear;
    Q_PROPERTY(QList<qreal> grid MEMBER grid)
    Q_PROPERTY(QString gear MEMBER gear)
};

Q_DECLARE_METATYPE(displayData_t)

struct displayLabels_t{
    Q_GADGET
public:
    QList<QString> gridLabel;
    Q_PROPERTY(QList<QString> gridLabel MEMBER gridLabel)
};

Q_DECLARE_METATYPE(displayLabels_t)

class DisplayDrv : public QObject
{
    Q_OBJECT
    Q_PROPERTY(displayData_t displayData READ readDisplayData NOTIFY newDisplayData)
    Q_PROPERTY(displayLabels_t displayLabels READ readDisplayLabels NOTIFY newDisplayLabels)

public:
    explicit DisplayDrv(QObject *parent = nullptr);
    displayData_t readDisplayData();
    displayLabels_t readDisplayLabels();

signals:
    void newDisplayData();
    void newDisplayLabels();

public slots:
    void setCanData(canData_t cd);

private:
    displayData_t m_displayData;
    displayLabels_t m_displayLabels;
    canData_t m_canData;
};

#endif // DISPLAYDRV_H
