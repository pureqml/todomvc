Column {
	id: todoStatusProto;
	signal modeChoosed;
	property int todoCount;
	anchors.left: parent.left;
	anchors.right: parent.right;
	spacing: 1;

	TodoRectangle {
		height: 35;

		Text {
			anchors.left: parent.left;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.leftMargin: 15;
			font.pixelSize: 14;
			color: "#777";
			text: parent.parent.todoCount + " items left";
		}

		ListView {
			width: contentWidth;
			height: contentHeight;
			orientation: ListView.Horizontal;
			anchors.centerIn: parent;
			spacing: 20;
			model: ListModel {
				ListElement { text: "All" } ListElement { text: "Active" } ListElement { text: "Completed" }
			}
			delegate: Rectangle {
				ClickMixin { }
				property Mixin hoverMixin: HoverMixin { }
				property int index: model.index;
				width: statusDelegateText.width + 10;
				height: statusDelegateText.height + 5;
				radius: 5;
				border.width: hoverMixin.value || parent.currentIndex == index ? 1 : 0;
				border.color: parent.currentIndex == index ? "#AF2F2F32" : "#AF2F2F19";

				Text {
					id: statusDelegateText;
					anchors.centerIn: parent;
					font.pixelSize: 14;
					color: "#777";
					text: model.text;
				}

				onClicked: { this.parent.choose(this.index) }
			}

			choose(idx): {
				this.currentIndex = idx
				todoStatusProto.modeChoosed(this.model.get(idx).text)
			}
		}
	}

	TodoRectangle {
		height: 4;
		anchors.leftMargin: 3;
		anchors.rightMargin: 3;
	}

	TodoRectangle {
		height: 4;
		anchors.leftMargin: 6;
		anchors.rightMargin: 6;
	}
}
