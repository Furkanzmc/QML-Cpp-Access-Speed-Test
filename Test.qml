import QtQuick 2.0
import QtQuick.Controls 2.4
import Test 1.0

Column {
    spacing: 15

    Row {
        spacing: 5

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "Loop Count"
        }

        SpinBox {
            id: spin
            value: 1
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "Calls " + spin.value * 1000000 + " times."
        }
    }

    Grid {
        spacing: 10

        Column {
            width: Math.max(btn1.width, lb1.contentWidth)

            Button {
                id: btn1
                text: "Call Method Using Singleton"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            SingletonTest.test();
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb1.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb1
            }
        }

        Column {
            width: Math.max(btn2.width, lb1.contentWidth)

            Button {
                id: btn2
                text: "Call Method Using Context Property"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            st.test();
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb2.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb2
            }
        }

        Column {
            width: Math.max(btn3.width, lb3.contentWidth)

            Button {
                id: btn3
                text: "Access Property Using Singleton"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            SingletonTest.intProperty;
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb3.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb3
            }
        }

        Column {
            width: Math.max(btn4.width, lb4.contentWidth)

            Button {
                id: btn4
                text: "Access Property Using Context Property"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            st.test();
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb4.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb4
            }
        }

        Column {
            width: Math.max(btn5.width, lb3.contentWidth)

            Button {
                id: btn5
                text: "Access Property Using Instantiated Object"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            instance.intProperty;
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb5.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb5
            }
        }

        Column {
            width: Math.max(btn6.width, lb3.contentWidth)

            Button {
                id: btn6
                text: "Call Method Using Instantiated Object"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            instance.intProperty;
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb6.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb6
            }
        }

        Column {
            width: Math.max(btn7.width, lb7.contentWidth)

            Button {
                id: btn7
                text: "Call Method Using JS Context Var"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    var mySingleton = st;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            mySingleton.test();
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb7.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb7
            }
        }

        Column {
            width: Math.max(btn8.width, lb8.contentWidth)

            Button {
                id: btn8
                text: "Call Method Using JS Singleton Var"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    var mySingleton = SingletonTest;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            mySingleton.test();
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb8.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb8
            }
        }

        Column {
            width: Math.max(btn9.width, lb9.contentWidth)

            Button {
                id: btn9
                text: "Access Property Using JS Context Var"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    var mySingleton = st;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            mySingleton.intProperty;
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb9.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb9
            }
        }

        Column {
            width: Math.max(btn10.width, lb10.contentWidth)

            Button {
                id: btn10
                text: "Access Property Using JS Singleton Var"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    var mySingleton = SingletonTest;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            mySingleton.test();
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb10.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb10
            }
        }

        Column {
            width: Math.max(btn11.width, lb11.contentWidth)

            Button {
                id: btn11
                text: "Access Enum"
                onClicked: {
                    var values = [];
                    var startDateSingleton = null;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            SingletonTest.EnumVal;
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb11.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb11
            }
        }

        Column {
            width: Math.max(btn12.width, lb12.contentWidth)

            Button {
                id: btn12
                text: "Access Enum Using JS Var"
                onClicked: {
                    var values = [];
                    var inst = SingletonTest;
                    var startDateSingleton = null;
                    for (var j = 0; j < spin.value; j++) {
                        startDateSingleton = new Date();

                        for (var i = 0; i < 1000000; i++) {
                            inst.EnumVal;
                        }

                        var delta = new Date() - startDateSingleton;
                        values.push(delta);
                    }

                    values = values.sort();
                    lb12.text = "Fastest: " + (values[0] / 1000) + "\nSlowest: " + (values[values.length - 1] / 1000);
                }
            }

            Text {
                id: lb12
            }
        }
    }

    SingletonTestInst { id: instance }
}
