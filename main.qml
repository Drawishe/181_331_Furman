import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.14
import QtMultimedia 5.14

ApplicationWindow {
    visible: true
    width: 640
    height: 848
    title: qsTr("Мобильные разработки Фурман К.В. 181-331")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page {
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
            ColumnLayout{
                anchors.fill: parent
                GridView{
                    id: grid
                    visible: true
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    enabled: true
                    clip: true
                    anchors.margins: 10
                    cellHeight: 150
                    cellWidth: 650


                    delegate: Item {
                        height: grid.cellHeight
                        width: grid.cellWidth



                        Rectangle{

                            id:rect2
                            color: "#57bfff"
                            anchors.fill: parent
                            border.color: "#2baeff"
                            anchors.margins: 5
                            border.width: 2

                            radius: 10
                            GridLayout{
                                anchors.fill: parent
                                Label{ // заголовок
                                    id: txt_head
                                    color: "black"
                                    text: model_name
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: 100
                                    Layout.margins: 20
                                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                }

                                Label{ // Описание
                                    id: txt_body
                                    color: "black"
                                    text: model_author
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: 100
                                    Layout.margins: 20
                                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                }


                                Image{
                                    source: model_image
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: 100


                                }
                                Button{
                                    onClicked: {
                                        player.source = model_file
                                        cover.source = model_image
                                        swipeView.currentIndex = 1}
                                }


                            }
                        }
                    }

                    model: ListModel{
                        id: model_exam
                        ListElement{
                            //id: song1
                            model_file: "D:/MobDev Exam/181_331_Furman/music/Parallel-FSM.mp3"
                            model_name: "Parallel"
                            model_author: "FSM"
                            model_image: "qrc:/covers/Parallel-FSM.jpg"
                        }
                        ListElement{
                            //id: song2
                            model_file: "D:/MobDev Exam/181_331_Furman/music/Relax-roa.mp3"
                            model_name: "Relax"
                            model_author: "Roa"
                            model_image: "qrc:/covers/Relax-Roa.jpg"
                        }
                        ListElement{
                            //id: song3
                            model_file: "D:/MobDev Exam/181_331_Furman/music/Start-Vlad.mp3"
                            model_name: "Stars"
                            model_author: "Vlad"
                            model_image: "qrc:/covers/Stars-Vlad.jpg"
                        }
                        ListElement{
                            //id: song4
                            model_file: "D:/MobDev Exam/181_331_Furman/music/Calm-Vlad.mp3"
                            model_name: "Calm"
                            model_author: "Vlad"
                            model_image: "qrc:/covers/unknown.jpg"
                        }
                        ListElement{
                            //id: song5
                            model_file: "D:/MobDev Exam/181_331_Furman/music/Reason-Maittre.mp3"
                            model_name: "Reason"
                            model_author: "Maitte"
                            model_image: "qrc:/covers/unknown.jpg"
                        }

                    }
                }
            }

        }
        Page {
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
                anchors.fill: parent
                columns: 4
                rows: 5
                Image {
                    Layout.column: 0
                    Layout.columnSpan: 4
                    Layout.row: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    fillMode: Image.PreserveAspectFit

                    id:  cover

                }
                MediaPlayer{
                    Layout.row: 1
                    Layout.column: 1
                    id: player
                    onPositionChanged: {
                        timeline.sync = true
                        timeline.value = player.position
                        timeline.sync = false
                    }



                }
//                RadioButton{
//                    id:rc1
//                    checked: {if(rc2.checked){true}}

//                }
//                RadioButton{
//                    id:rc2
//                    checked: {if(rc3.checked){true}}
//                }
//                RadioButton{
//                    id: rc3
//                    checked: {if(rc4.checked){true}}
//                }
//                RadioButton{
//                    id: rc4
//                    checked: {if(rc5.checked){true}}
//                }
//                RadioButton{
//                    id: rc5

//                }


                TextField{
                    readOnly: true
                    Layout.row: 3
                    Layout.column: 0
                    Layout.columnSpan: 1
                    text: player.duration / 60000
                    maximumLength: 4

                }
                TextField{
                    readOnly: true
                    Layout.row: 3
                    Layout.column: 3
                    Layout.columnSpan: 1
                    text: player.position / 60000
                    maximumLength: 4
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
                    flat: true

                }
//                Item{
//                Layout.column: 1
//                Layout.row: 5
//                }
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
                    flat: true

                }



            }
        }
    }
    Drawer {
        id: drawer
        width: parent.width * 0.67
        height: parent.height
        dragMargin: 20
        ColumnLayout{
            anchors.fill: parent
            Text {
                text: qsTr("Проигрыватель")
                font.pixelSize: 20
            }
            TextEdit {
                readOnly: true
                text: qsTr("Экзаменационное задание\n по дисциплине\n Разработка безопасных мобильных\n приложений , Московский Политех,\n 30 июня 2020г.")
                wrapMode: Text.WrapAnywhere
                font.pixelSize: 16
            }
            Image {
                source: "./img/polytech.jpg"
            }
            Text {

                text: qsTr("Автор: fogreen7@gmail.com")
                font.pixelSize: 20
            }
            Text {
                text: "<a href=\"https://github.com/Drawishe/\n181_331_Furman\">https://github.com/Drawishe/\n181_331_Furman</a>"
                font.pixelSize: 14

            }




        }


    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex


    }
}
