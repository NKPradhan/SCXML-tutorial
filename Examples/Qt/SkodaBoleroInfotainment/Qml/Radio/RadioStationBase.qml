import QtQuick 2.12
import QtQuick.Layouts 1.12
import ScxmlBolero 1.0
import "qrc:/Qml"
import "qrc:/Qml/AppConstants.js" as AppConsts

SelectButton {
    id: station

    gradientColor: image.source ? "#80ffffff" : "white"

    property real mousePressedX: 0
    property real mousePressedY: 0

    property int stationIndex: 0
    readonly property real frequency: scxmlBolero.getRadioFreq(station.stationIndex)

    Text {
        id: numberText
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 8
        text: station.stationIndex + 1
        color: AppConsts.cl_ITEM_TEXT
        style: Text.Outline
        font.family: "Tahoma"
        font.pixelSize: 16
        visible: image.source == ""
    }

    Image {
        id: image
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -caption.height / 2
        width: station.width / 1.3
        height: station.height / 1.3
        antialiasing: true

        /* do not use 'cache' ! because it does not update image immediately after logo copy */
        cache: false

        source: scxmlBolero.getRadioLogosSource(station.stationIndex)
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: caption
        text: scxmlBolero.getRadioCaption(station.frequency, "16", "14")
        textFormat: Text.RichText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3

        color: AppConsts.cl_ITEM_TEXT
        style: Text.Outline
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        font.family: "Tahoma"
        font.pixelSize: 16
    }
}
