/*
  Q Light Controller Plus
  FunctionDelegate.qml

  Copyright (c) Massimo Callegari

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0.txt

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*/

import QtQuick 2.0
import com.qlcplus.classes 1.0

Rectangle {
    id: funcDelegate
    width: 100
    height: 35

    color: "transparent"

    property int functionID: -1
    property Function func
    property string textLabel
    property bool isSelected: false

    signal clicked

    onFunctionIDChanged: {
        func = functionManager.getFunction(functionID)
        textLabel = func.name
        funcEntry.functionType = func.type
    }

    Rectangle {
        anchors.fill: parent
        radius: 3
        color: "#0978FF"
        visible: isSelected
    }

    IconTextEntry {
        id: funcEntry
        width: parent.width
        height: parent.height
        tLabel: textLabel
    }
    Rectangle {
        width: parent.width
        height: 1
        y: parent.height - 1
        color: "#666"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            isSelected = true
            functionManager.selectFunction(functionID, funcDelegate,
                                           (mouse.modifiers & Qt.ControlModifier))
            funcDelegate.clicked()
        }
    }
}
