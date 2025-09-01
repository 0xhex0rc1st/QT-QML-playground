import QtQuick 2.15
import QtQuick.Controls 2.0
import QtQuick.Window 2.15

Window {
    id: win
    width: 640
    height: 480
    visible: true
    color: "gray"
    title: qsTr("Signin/Signup")
    property bool islogin: true
    property bool reset_pass: false
    property int countdown: 60

    Rectangle {
        id: rectangle_signup
        visible: !islogin
        width: win.width / 1.2
        height: win.height / 2.3
        color: white
        border.color: "black"
        border.width: 2
        radius: 10
        anchors.centerIn: parent
        TextField {
            id: signup_email
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.067
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            placeholderText: "Email address"
            inputMethodHints: Qt.ImhEmailCharactersOnly
        }

        TextField {
            id: signup_pass
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: signup_email.bottom
            anchors.margins: parent.width * 0.067
            anchors.bottomMargin: 0
            anchors.topMargin: parent.height * 0.0335
            height: parent.height * 0.12
            placeholderText: "Password"
            echoMode: TextInput.Password
        }

        TextField {
            id: signup_passconfirm
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: signup_pass.bottom
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.0335
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            placeholderText: "Confirm password"
            echoMode: TextInput.Password
        }

        TextField {
            id: signup_code
            anchors.left: parent.left
            anchors.top: signup_passconfirm.bottom
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.0335
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            anchors.right: signup_sendcode.left
            anchors.rightMargin: 10
            placeholderText: "Code"
        }

        Button {
            id: signup_sendcode
            anchors.right: parent.right
            anchors.top: signup_passconfirm.bottom
            width: login.width / 4
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.0335
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            text: qsTr("Send code")
            Timer {
                id: signup_timer_countdown
                interval: 1000
                repeat: true
                running: false
                onTriggered: {
                    if (countdown > 1) {
                        countdown--
                        signup_sendcode.text = "Resend after " + countdown + "s"
                    } else {
                        countdown = 60
                        signup_sendcode.text = "Send code"
                        signup_timer_countdown.stop()
                        signup_sendcode.enabled = true
                    }
                }
            }

            onClicked: {
                signup_sendcode.enabled = false
                signup_sendcode.text = "Resend after " + countdown + "s"
                signup_timer_countdown.start()
            }
        }

        Button {
            id: signup
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: signup_sendcode.bottom
            anchors.topMargin: parent.height * 0.0335
            anchors.leftMargin: parent.width * 0.067
            anchors.rightMargin: parent.width * 0.067
            anchors.bottomMargin: parent.height * 0.067
            height: parent.height * 0.12
            text: qsTr("Signup")
            font.bold: true
        }

        Button {
            id: login_p
            anchors.right: signup.right
            anchors.left: signup.left
            anchors.top: signup.bottom
            anchors.topMargin: parent.height * 0.01675
            contentItem: Text {
                text: qsTr("Login")
                font.pixelSize: 10
                color: "blue"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onClicked: {
                islogin = true
            }
        }
    }

    Rectangle {
        id: rectangle_login
        visible: islogin
        width: win.width / 1.2
        height: win.height / 2.3
        color: white
        border.color: "black"
        border.width: 2
        radius: 10
        anchors.centerIn: parent

        TextField {
            id: login_email
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.067
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            placeholderText: "Email address"
            inputMethodHints: Qt.ImhEmailCharactersOnly
        }

        TextField {
            id: login_pass
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: login_email.bottom
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.0335
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            placeholderText: "Password"
            echoMode: TextInput.Password
        }

        Button {
            id: login
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: login_pass.bottom
            anchors.topMargin: parent.height * 0.0335
            anchors.leftMargin: parent.width * 0.067
            anchors.rightMargin: parent.width * 0.067
            anchors.bottomMargin: parent.height * 0.067
            height: parent.height * 0.12
            text: qsTr("Login")
            font.bold: true
        }

        Button {
            id: signup_p
            anchors.right: login.right
            anchors.top: login.bottom
            width: parent.width / 4
            height: login.height / 2
            anchors.topMargin: parent.height * 0.01675
            contentItem: Text {
                text: qsTr("Signup")
                font.pixelSize: 10
                color: "blue"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onClicked: {
                islogin = false
            }
        }

        Button {
            id: forgot_pass
            anchors.left: login.left
            anchors.top: login.bottom
            width: parent.width / 4
            height: login.height / 2
            anchors.topMargin: parent.height * 0.01675
            contentItem: Text {
                text: qsTr("Forgot password?")
                font.pixelSize: 10
                color: "blue"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onClicked: {
                reset_pass = true
            }
        }
    }

    Rectangle {
        id: pass_recovery
        visible: reset_pass
        width: win.width / 1.2
        height: win.height / 2.3
        color: white
        border.color: "black"
        border.width: 2
        radius: 10
        anchors.centerIn: parent

        TextField {
            id: recovery_email
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.067
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            placeholderText: "Email address"
            inputMethodHints: Qt.ImhEmailCharactersOnly
        }

        TextField {
            id: recovery_code
            anchors.left: parent.left
            anchors.top: recovery_email.bottom
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.0335
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            anchors.right: recovery_sendcode.left
            anchors.rightMargin: 10
            placeholderText: "Code"
        }

        Button {
            id: recovery_sendcode
            anchors.right: parent.right
            anchors.top: recovery_email.bottom
            width: login.width / 4
            anchors.margins: parent.width * 0.067
            anchors.topMargin: parent.height * 0.0335
            anchors.bottomMargin: 0
            height: parent.height * 0.12
            text: qsTr("Send code")
            Timer {
                id: recovery_timer_countdown
                interval: 1000
                repeat: true
                running: false
                onTriggered: {
                    if (countdown > 1) {
                        countdown--
                        recovery_sendcode.text = "Resend after " + countdown + "s"
                    } else {
                        countdown = 60
                        recovery_sendcode.text = "Send code"
                        recovery_timer_countdown.stop()
                        recovery_sendcode.enabled = true
                    }
                }
            }

            onClicked: {
                recovery_sendcode.enabled = false
                recovery_sendcode.text = "Resend after " + countdown + "s"
                recovery_timer_countdown.start()
            }
        }

        Button {
            id: recovery_continue
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: recovery_sendcode.bottom
            anchors.topMargin: parent.height * 0.0335
            anchors.leftMargin: parent.width * 0.067
            anchors.rightMargin: parent.width * 0.067
            anchors.bottomMargin: parent.height * 0.067
            height: parent.height * 0.12
            text: qsTr("Continue")
            font.bold: true
        }

        Button {
            anchors.right: recovery_continue.right
            anchors.left: recovery_continue.left
            anchors.top: recovery_continue.bottom
            anchors.topMargin: parent.height * 0.01675
            contentItem: Text {
                text: qsTr("Back to log in")
                font.pixelSize: 10
                color: "blue"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            onClicked: {
                islogin = true
                reset_pass = false
            }
        }
    }
}
