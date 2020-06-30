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
        columns: 5
        rows: 6
        Image {
            Layout.column: 1
            Layout.columnSpan: 4
            Layout.row: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            id:  cover
            source: "./covers/Parallel Synthesis.jpg"

        }
        MediaPlayer{
            id: player
            source: "./music/Parallel Synthesis FSM.mp3"
            //volume: vol.value
            onPositionChanged: {
                timeline.sync = true
                timeline.value = player.position
                timeline.sync = false
            }



        }


        Slider{
            Layout.row: 4
            Layout.column: 0
            Layout.columnSpan: 4
            Layout.fillWidth: true
            id: timeline
            to: player.duration
            property bool sync: false
            onValueChanged: {if(!sync){player.seek(value)}}
            Material.accent: "#727cf5"
        }
        //Кнопка Перемешивания
        Button{
            Layout.row: 5
            Layout.column: 0

        }
        //Кнопка Назад
        Button{
            Layout.row: 5
            Layout.column: 1
            text: "|◄ "
            flat: true

        }
        //Кнопка Play|Pause
        Button{
            Layout.row: 5
            Layout.column: 2
            flat: true
            text: player.playbackState === MediaPlayer.PlayingState ? "||" : "►"
            onClicked: player.playbackState === MediaPlayer.PlayingState ?
                           player.pause() : player.play()


        }
        //Кнопка Вперед
        Button{
            Layout.row: 5
            Layout.column: 3
            text: "►|"
            flat: true

        }
        //Кнопка Повтора
        Button{
            Layout.row: 5
            Layout.column: 4

        }



    }
}
