import QtQuick 2.0
import "qrc:/Qml"

Loader {
    id: popupLoader

    property real popupX: 0
    property real popupY: 0

    property real offsetX: 0
    property real offsetY: 0

    x: popupX + offsetX
    y: popupY + offsetY

    width: 200
    height: 126

    sourceComponent: scxmlBolero.radioPopupBands ? popupComponent : undefined

    Component {
        id: popupComponent
        BalloonPopup {
            id: balloon
            balloonDirection: BalloonCanvas.BalloonDirection.Bottom
            eventName: "Radio.BandType"

            model: [
                { text: "FM", eventData: "FM", keyCentered: true, textKeyHorizAlign: Text.AlignHCenter },
                { text: "AM", eventData: "AM", keyCentered: true, textKeyHorizAlign: Text.AlignHCenter, row: 1 }
            ]

            Component.onCompleted: {
                popupLoader.offsetX = -1.0 * (balloon.triangleOffset + balloon.triangleEdge + balloon.lineWidth)
            }
        }
    }
}
