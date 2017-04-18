ListView {
	height: contentHeight;
	anchors.left: parent.left;
	anchors.right: parent.right;
	model: ListModel { ListElement {} }
	delegate: Rectangle {
		height: 65;
		anchors.left: parent.left;
		anchors.right: parent.right;
		color: "#fff";
		border.width: 1;
		border.color: "#ddd";
	}
}
