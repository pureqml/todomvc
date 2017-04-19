ListView {
	height: contentHeight;
	anchors.left: parent.left;
	anchors.right: parent.right;
	model: todoModel;
	delegate: Rectangle {
		signal deleted;
		signal markedDone;
		property bool editMode;
		property int index: model.index;
		height: todoText.paintedHeight + 35;
		anchors.left: parent.left;
		anchors.right: parent.right;
		color: "#fff";
		border.width: 1;
		border.color: "#ddd";

		WebItem {
			width: 40;
			height: 40;
			anchors.verticalCenter: parent.verticalCenter;

			Text {
				property string checkboxOn: "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"40\" height=\"40\" viewBox=\"-10 -18 100 135\"><circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"none\" stroke=\"#bddad5\" stroke-width=\"3\"/><path fill=\"#5dc2af\" d=\"M72 25L42 71 27 56l-4 4 20 20 34-52z\"/></svg>";
				property string checkboxOff: "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"40\" height=\"40\" viewBox=\"-10 -18 100 135\"><circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"none\" stroke=\"#ededed\" stroke-width=\"3\"/></svg>";
				anchors.fill: parent;
				text: model.done ? checkboxOn : checkboxOff;
			}

			onClicked: { this.parent.toggleDone() }
		}

		Text {
			id: todoText;
			anchors.left: parent.left;
			anchors.right: parent.right;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.leftMargin: 50;
			anchors.rightMargin: 50;
			font.pixelSize: 24;
			font.strike: model.done;
			text: model.text;
			color: model.done ? "#d9d9d9" : "#4d4d4d";
			wrapMode: Text.WrapAnywhere;
		}

		toggleDone: { this.parent.toggleDone(this.index) }
	}

	toggleDone(idx): { this.model.toggleDone(idx) }
}
