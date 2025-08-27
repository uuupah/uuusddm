import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: userField
  selectByMouse: true
  echoMode: TextInput.Normal
  selectionColor: config.textDefault
  renderType: Text.NativeRendering
  font {
    family: config.Font
    pixelSize: config.FontSize
    bold: false
  }
  color: config.textDefault
  width: 300 // TODO set this in config
  text: userModel.lastUser
  background: Rectangle {
    id: userFieldBackground
    color: config.background
  }
}
