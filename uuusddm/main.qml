import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "Components"

Item {
  id: root
  height: Screen.height
  width: Screen.width
  Rectangle {
    id: background
    anchors.fill: parent
    height: parent.height
    width: parent.width
    z: 0
    color: config.background
  }
  Image {
    id: backgroundImage
    anchors.fill: parent
    height: parent.height
    width: parent.width
    fillMode: Image.PreserveAspectCrop
    visible: config.CustomBackground == "true" ? true : false
    z: 1
    source: config.wallpaper
    asynchronous: false
    cache: true
    mipmap: true
    clip: true
  }
  Item {
    id: mainPanel
    z: 3
    anchors {
      fill: parent
    }
    property date dateTime: new Date()
    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: mainPanel.dateTime = new Date()
    }
    Text {
      id: time
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.verticalCenter
      anchors.verticalCenterOffset: -500
      color: config.foreground
      text : Qt.formatDateTime(mainPanel.dateTime, "yyyy年MM月dd日 HH:mm:ss")
      font.pixelSize: 16
      font.family: config.ClockFont
      renderType: Text.NativeRendering
    }
    LoginPanel {
      id: loginPanel
      anchors.fill: parent
    }
  }
}
