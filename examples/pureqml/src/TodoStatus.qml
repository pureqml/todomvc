Column {
	property int todoCount;
	anchors.left: parent.left;
	anchors.right: parent.right;
	spacing: 1;

	TodoRectangle {
		height: 35;

		Text {
			text: parent.parent.todoCount + " items left";
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
