import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

Page{
    id: page2
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
                    onClicked: swipeView.currentIndex = 0
                    font.pixelSize: 40
                    text: "←"
                    flat: true
                }
                Label{
                    Layout.column: 0
                    Layout.columnSpan: 3
                    font.pixelSize: 18
                    text: "Воспроизведение"
                    font.bold: true
                    Layout.alignment: Qt.AlignCenter
                }

            }
    }
    GridLayout{
        columns: 6
        rows: 6
        Image {
            Layout.column: 1
            Layout.columnSpan: 4
            Layout.row: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            id:  cover
            source: "file"

        }
        MediaPlayer{
            id: mdplayer
            source: ""
            volume: vol.value
            onPositionChanged: {
                timeline.sync = true
                timeline.value = mdplayer.position
                timeline.sync = false
            }



        }


        Slider{
            id: timeline
            to: mdplayer.duration
            property bool sync: false
            onValueChanged: {if(!sync){mdplayer.seek(value)}}
            Layout.fillWidth: true
            Material.accent: Material.Teal
        }
        //Кнопка Перемешивания
        Button{

        }
        //Кнопка Назад
        Button{
            text: "|◄ "
            flat: true

        }
        //Кнопка Play|Pause
        Button{
            flat: true
            text: mdplayer.playbackState === MediaPlayer.PlayingState ? "||" : "►"
            onClicked: mdplayer.playbackState === MediaPlayer.PlayingState ?
                           mdplayer.pause() : mdplayer.play()


        }
        //Кнопка Вперед
        Button{
            text: "►|"
            flat: true

        }
        //Кнопка Повтора
        Button{

        }



    }
}
