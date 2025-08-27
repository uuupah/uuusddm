import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.2

Item {
  property var user: userField.text
  property var password: passwordField.text
  property var session: sessionPanel.session
  property var inputHeight: 144
  property var inputWidth: 444
  height: parent.height
  width: parent.width
  Rectangle {
    id: loginBackground
    anchors.centerIn: parent
    height: 62
    width: 502
    radius: 0
    border.color: config.foreground
    border.width: 1
    // visible: config.LoginBackground == "true" ? true : false
    visible: true
    color: config.background
  }
  Column {
    spacing: 8
    anchors {
      bottom: parent.bottom
      left: parent.left
    }
    PowerButton {
      id: powerButton
    }
    RebootButton {
      id: rebootButton
    }
    SleepButton {
      id: sleepButton
    }
    z: 5
  }
  Column {
    spacing: 8
    anchors {
      bottom: parent.bottom
      right: parent.right
    }
    SessionPanel {
      id: sessionPanel
    }
    z: 5
  }
  Column {
    id: column
    spacing: -4
    z: 5
    width: inputWidth
    anchors {
      verticalCenter: loginBackground.verticalCenter
      horizontalCenter: loginBackground.horizontalCenter
    }
    Row {
      width: parent.width
      height: 16
      spacing: -4
      Text {
        anchors {
          verticalCenter: parent.verticalCenter
        }
        font {
          family: config.Font
          pixelSize: 16
        }
        renderType: Text.NativeRendering
        color: config.foreground
        text: "username: "
      }
      TextField {
        id: userField
        selectByMouse: true
        echoMode: TextInput.Normal
        selectionColor: config.dim
        renderType: Text.NativeRendering
        anchors {
          verticalCenter: parent.verticalCenter
        }
        font {
          family: config.Font
          pixelSize: config.FontSize
          bold: false
        }
        background: transparent
        color: config.foreground
        width: inputWidth // TODO set this in config
        text: userModel.lastUser
      }
    }
    Row {
      width: parent.width
      height: 16
      id: passwordRow
      spacing: -4
      anchors {
        verticalCenter: userField
        horizontalCenter: parent.horizontalCenter
      }
      Text {
        anchors {
          verticalCenter: parent.verticalCenter
        }
        font {
          family: config.Font
          pixelSize: 16
        }
        renderType: Text.NativeRendering
        color: config.foreground
        text: "password: "
      }
      TextField {
        id: passwordField
        focus: true
        selectByMouse: true
        placeholderTextColor: config.textPlaceholder
        echoMode: TextInput.Password
        passwordCharacter: "*"
        passwordMaskDelay: config.PasswordShowLastLetter
        selectionColor: config.textDefault
        renderType: Text.NativeRendering
        anchors {
          verticalCenter: parent.verticalCenter
        }
        font {
          family: config.Font
          pixelSize: config.FontSize
          bold: false
        }
        color: config.foreground
        width: inputWidth // TODO set this in config
        background: transparent
        Layout.preferredWidth: (inputWidth - loginButton.width - row.spacing)
        Layout.preferredHeight: 30
        // onAccepted: loginButton.clicked()
        onAccepted: sddm.login(user, password, session)
      }
    }
  }
  Connections {
    target: sddm

    function onLoginFailed() {
      passwordField.text = "authentication failed"
      passwordField.focus = true
    }
  }
}
