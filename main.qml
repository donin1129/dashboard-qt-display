import QtQuick 2.6
import QtQuick.Window 2.2
import CanDrv 1.0
import DisplayDrv 1.0

Window {
    id: window
    visible: true
    // visibility: "FullScreen"
    width: 800;
    height: 480;
    color: "black"
    property alias window: window
    title: qsTr("Rennteam 11-14 Display")


    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: cd.mockCanData()
    }

    // Access DisplayDrv
    DisplayDrv {
        id: dd
    }

    // Background picture
    BorderImage {
        id: borderImage
        x: 0
        y: 0
        width: 800
        height: 480
        visible: true
        source: "carbonfiber_background.png"

        Image {
            id: image
            x: 375
            y: 380
            width: 50
            height: 50
            source: "horse.png"
            fillMode: Image.PreserveAspectFit
        }

        // Circles in the bottom
        Rectangle {
            id: screen1
            x: 350
            y: 440
            width: 20
            height: 20
            color: "#808080"
            radius: 10
        }

        Rectangle {
            id: screen2
            x: 390
            y: 440
            width: 20
            height: 20
            color: "#808080"
            radius: 10
        }

        Rectangle {
            id: screen3
            x: 430
            y: 440
            width: 20
            height: 20
            color: "#808080"
            radius: 10
        }
    }

    // Reference to RevStyle that display the rmp count
    RevStyle {
        id: rev
        width: 800
        height: 200
        currentRev: dd.displayData.grid[11].toFixed(1)

        minRev: 0
        maxRev: 10000

        numRec: 20
    }

    // Get the gear number
    Text {
        id: gear
        x: 300
        y: 202.5
        color: "#ffffff"
        width: 200
        height: 145
        text: dd.displayData.gear
        //text: qsTr("#dd.displayData.gear#")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
        ///wrapMode: Text.NoWrap
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        clip: false
        font.pixelSize: 200
    }

    // Display 1
    Item {
        id: display1
        x: 0
        y: 0
        width: 800
        height: 480
        visible: (dd.displayData.grid[14] === 0)

        // Bottom Circle Highlight
        Rectangle {
            id: screen1_check
            x: 350
            y: 440
            width: 20
            height: 20
            color: "#ffffff"
            radius: 10
        }

        // Following graphic is for the left hand side

        Text {
            id: speed
            x: 181
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "km/h"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: speed_data
            x: 53
            y: 200
            width: 200
            height: 190
            color: "#f5eca5"
            text: dd.displayData.grid[11].toFixed(1)
            verticalAlignment: Text.AlignBottom
            fontSizeMode: Text.Fit
            font.family: "Tahoma"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 400
        }

        // Following graphic is for the right hand side

        Text {
            id: steering
            x: 522
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "Steering"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: throttle
            x: 650
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "Throttle"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }



        Image {
            id: image1
            x: 550
            y: 200
            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit
            source: "steering_wheel.png"
        }

        Text {
            id: steering_data
            x: 522
            y: 300
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[10].toFixed(1)
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Text {
            id: throttle_data
            x: 650
            y: 300
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[12].toFixed(1)
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

    }

    // Display 2
    Item {
        id: display2
        x: 0
        y: 0
        width: 800
        height: 480
        visible: (dd.displayData.grid[14] === 1)

        // Bottom Circle Highlight
        Rectangle {
            id: screen2_check
            x: 350
            y: 440
            width: 20
            height: 20
            color: "#ffffff"
            radius: 10
        }

        // Following graphic is for the left hand side

        Text {
            id: amb_temp
            x: 181
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "Amb Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: amb_pres
            x: 181
            y: 250
            width: 100
            height: 40
            color: "#ffffff"
            text: "Amb Pres"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: fuel_temp
            x: 53
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "Fuel Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: fuel_pres
            x: 53
            y: 250
            width: 100
            height: 40
            color: "#ffffff"
            text: "Fuel Pres"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: amb_temp_data
            x: 181
            y: 300
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[2].toFixed(1)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Text {
            id: amb_pres_data
            x: 181
            y: 200
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[6].toFixed(1)
            wrapMode: Text.NoWrap
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Text {
            id: fuel_temp_data
            x: 53
            y: 300
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[4].toFixed(1)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Text {
            id: fuel_pres_data
            x: 53
            y: 200
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[7].toFixed(1)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        // Following graphic is for the right hand side

        Text {
            id: brake_pres_L
            x: 522
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "Brk Pres (L)"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: brake_pres_R
            x: 650
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "Brk Pres (R)"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: brake_pres_L_data
            x: 522
            y: 300
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[9].toFixed(1)
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Text {
            id: brake_pres_R_data
            x: 650
            y: 300
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[8].toFixed(1)
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Image {
            id: brake_illustration
            x: 565
            y: 200
            width: 150
            height: 100
            fillMode: Image.PreserveAspectFit
            source: "brake_illustration.png"
        }
    }

    // Display 3

    Item {
        id: display3
        x: 0
        y: 0
        width: 800
        height: 480
        visible: (dd.displayData.grid[14] === 2)

        // Bottom Circle Highlight
        Rectangle {
            id: screen3_check
            x: 350
            y: 440
            width: 20
            height: 20
            color: "#ffffff"
            radius: 10
        }

        // Following graphic is for the left hand side

        Text {
            id: airbox_temp
            x: 181
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "Airbox Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: engineoil_pres
            x: 181
            y: 250
            width: 100
            height: 40
            color: "#ffffff"
            text: "EngOil Pres"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: enginewater_temp
            x: 53
            y: 350
            width: 100
            height: 40
            color: "#ffffff"
            text: "EngWater Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: engineoil_temp
            x: 53
            y: 250
            width: 100
            height: 40
            color: "#ffffff"
            text: "EngOil Temp"
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: airbox_temp_data
            x: 181
            y: 300
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[3].toFixed(1)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Text {
            id: engineoil_pres_data
            x: 181
            y: 200
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[5].toFixed(1)
            wrapMode: Text.NoWrap
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Text {
            id: enginewater_temp_data
            x: 53
            y: 300
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[0].toFixed(1)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Text {
            id: engineoil_temp_data
            x: 53
            y: 200
            width: 100
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[1].toFixed(1)
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        // Following graphic is for the right hand side

        Text {
            id: battery_voltage
            x: 550
            y: 350
            width: 150
            height: 40
            color: "#ffffff"
            text: "Battery Voltage"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 16
        }

        Text {
            id: battery_voltage_data
            x: 550
            y: 300
            width: 150
            height: 40
            color: "#ffffff"
            text: dd.displayData.grid[13].toFixed(1)
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            elide: Text.ElideRight
            font.pixelSize: 50
        }

        Image {
            id: battery_illustration
            x: 575
            y: 200
            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit
            source: "battery_illustration.png"
        }
    }

    // Access CanDrv
    CanDrv {
        id: cd
        onNewCanData: dd.setCanData(cd.canData)
    }
}























/*##^## Designer {
    D{i:18;invisible:true}D{i:10;invisible:true}D{i:33;invisible:true}D{i:19;invisible:true}
D{i:34;invisible:true}
}
 ##^##*/
