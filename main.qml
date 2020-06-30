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

        Page1 {
            id: page1
        }
        Page2 {
            id: page2
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
            }
            Text {
                text: qsTr("Экзаменационное задание по дисциплине Разработка безопасных мобильных приложений , Московский Политех, 30 июня 2020г.")
            }
            Image {
                source: "./img/polytech.jpg"
            }
            Text {

                text: qsTr("Автор: fogreen7@gmail.com")
            }
            Text {
                text: qsTr("https://github.com/Drawishe/181_331_Furman")
            }


        }


    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex


    }
}
