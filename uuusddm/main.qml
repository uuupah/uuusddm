import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
//import QtGraphicalEffects

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
    color: config.colorBackground
  }
  Image {
    id: backgroundImage
    anchors.fill: parent
    height: parent.height
    width: parent.width
    fillMode: Image.PreserveAspectCrop
    source: config.backgroundImage
    z: 1
    visible: false
    asynchronous: false
    cache: true
    mipmap: true
    clip: true
  }
//  this relies on qtgraphicaleffects, but it might make more sense to just preblur the image
//  GaussianBlur {
//    anchors.fill: backgroundImage
//    source: backgroundImage
//    radius: 5
//    samples: 3
//  }
  Item {
    id: mainPanel
    z: 2
    height: parent.height
    width: parent.width
    Rectangle {
      id: loginBackground
      width: 518
      height: 78
      color: config.colorBackground
      anchors.centerIn: parent
      z: 3
    }
    Rectangle {
      id: loginBorder
      width: 502
      height: 62
      color: "transparent"
      border.color: config.colorForeground
      border.width: 1
      anchors.centerIn: parent
      z: 4
    }
    TextField {
      id: userField
      renderType: Text.NativeRendering
      font {
        family: "ProggyClean Nerd Font"
        pixelSize: 16
        bold: false
      }
      placeholderText: "Username"
      placeholderTextColor: config.colorForeground
      color: config.colorForeground
      background: Rectangle {
        color: "transparent"
      }
    }
  }
}
