import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page{
    id: page1
    header: ToolBar{
            anchors.top: parent.top
            background: Rectangle{
                implicitHeight: 60
                implicitWidth: 100
                color: "#727cf5"
            }
            GridLayout{
                columns: 3
                anchors.fill:parent

                Button{
                    id: drawerb
                    Layout.column: 0
                    onClicked: drawer.open()
                    font.pixelSize: 40
                    text: "="
                    flat: true
                }
                Label{
                    Layout.column: 0
                    Layout.columnSpan: 3
                    font.pixelSize: 18
                    text: "Записи"
                    font.bold: true
                    Layout.alignment: Qt.AlignCenter
                }

            }
    }



}
