import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

import CanDrv 1.0
import DisplayDrv 1.0

Item {

    id: rev
    width: 800
    height: 200

    property int minRev: 0
    property int maxRev: 10000

    property int currentRev: dd.displayData.grid[11].toFixed(1)

    property int numRec: 20

    function numColoredRec(max,min,val,step){
        return Math.round((val-min)/(max-min)*step)
    }

    function recColor1(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 1){
            return "#58FF00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor2(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 2){
            return "#6AFF00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor3(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 3){
            return "#83FF00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor4(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 4){
            return "#96FF00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor5(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 5){
            return "#C1FF00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor6(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 6){
            return "#DAFF00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor7(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 7){
            return "#EDFF00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor8(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 8){
            return "#FFFF00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor9(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 9){
            return "#FFE600"
        }else{
            return "4D4D4D"
        }
    }

    function recColor10(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 10){
            return "#FFD400"
        }else{
            return "4D4D4D"
        }
    }

    function recColor11(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 11){
            return "#FFBC00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor12(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 12){
            return "#FFAA00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor13(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 13){
            return "#FF9100"
        }else{
            return "4D4D4D"
        }
    }

    function recColor14(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 14){
            return "#FF7F00"
        }else{
            return "4D4D4D"
        }
    }

    function recColor15(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 15){
            return "#FF6700"
        }else{
            return "4D4D4D"
        }
    }

    function recColor16(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 16){
            return "#FF0000"
        }else{
            return "4D4D4D"
        }
    }

    function recColor17(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 17){
            return "#FF0000"
        }else{
            return "4D4D4D"
        }
    }

    function recColor18(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 18){
            return "#FF0000"
        }else{
            return "4D4D4D"
        }
    }

    function recColor19(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 19){
            return "#FF0000"
        }else{
            return "4D4D4D"
        }
    }

    function recColor20(){
        if(numColoredRec(maxRev,minRev,currentRev,numRec) >= 20){
            return "#FF0000"
        }else{
            return "4D4D4D"
        }
    }

    DisplayDrv {
        id: dd
    }

    Rectangle {
        id: rectangle1
        x: 57.5
        y: 138.887
        width: 30
        height: 21.113
        color: recColor1()
    }

    Rectangle {
        id: rectangle2
        x: 92.5
        y: 138.662
        width: 30
        height: 21.338
        color: recColor2()
    }

    Rectangle {
        id: rectangle3
        x: 127.5
        y: 138.984
        width: 30
        height: 21.016
        color: recColor3()
    }

    Rectangle {
        id: rectangle4
        x: 162.5
        y: 138.657
        width: 30
        height: 21.343
        color: recColor4()
    }

    Rectangle {
        id: rectangle5
        x: 197.5
        y: 138.548
        width: 30
        height: 21.452
        color: recColor5()
    }

    Rectangle {
        id: rectangle6
        x: 232.5
        y: 136.397
        width: 30
        height: 23.603
        color: recColor6()
    }

    Rectangle {
        id: rectangle7
        x: 267.5
        y: 130
        width: 30
        height: 30
        color: recColor7()
    }

    Rectangle {
        id: rectangle8
        x: 302.5
        y: 122.036
        width: 30
        height: 37.964
        color: recColor8()
    }

    Rectangle {
        id: rectangle9
        x: 337.5
        y: 110.285
        width: 30
        height: 49.715
        color: recColor9()
    }

    Rectangle {
        id: rectangle10
        x: 372.5
        y: 97.632
        width: 30
        height: 62.368
        color: recColor10()
    }

    Rectangle {
        id: rectangle11
        x: 407.5
        y: 87.377
        width: 30
        height: 72.623
        color: recColor11()
    }

    Rectangle {
        id: rectangle12
        x: 442.5
        y: 78.531
        width: 30
        height: 81.469
        color: recColor12()
    }

    Rectangle {
        id: rectangle13
        x: 477.5
        y: 70.905
        width: 30
        height: 89.095
        color: recColor13()
    }

    Rectangle {
        id: rectangle14
        x: 512.5
        y: 64.779
        width: 30
        height: 95.221
        color: recColor14()
    }

    Rectangle {
        id: rectangle15
        x: 547.5
        y: 60.795
        width: 30
        height: 99.205
        color: recColor15()
    }

    Rectangle {
        id: rectangle16
        x: 582.5
        y: 60
        width: 30
        height: 100
        color: recColor16()
    }

    Rectangle {
        id: rectangle17
        x: 617.5
        y: 60
        width: 30
        height: 100
        color: recColor17()
    }

    Rectangle {
        id: rectangle18
        x: 652.5
        y: 60
        width: 30
        height: 100
        color: recColor18()
    }

    Rectangle {
        id: rectangle19
        x: 687.5
        y: 60
        width: 30
        height: 100
        color: recColor19()
    }

    Rectangle {
        id: rectangle20
        x: 722.5
        y: 60
        width: 30
        height: 100
        color: recColor20()
    }
}
