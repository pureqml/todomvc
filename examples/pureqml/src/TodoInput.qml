Rectangle {
	height: 65;
	anchors.left: parent.left;
	anchors.right: parent.right;
	color: "#fff";

	Text {
		id: selectAllCheckbox;
		anchors.left: parent.left;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.leftMargin: 15;
		font.pixelSize: 22;
		color: "#e6e6e6";
		transform.rotate: 90;
		text: "❯";
	}

	TextInput {
		anchors.top: parent.top;
		anchors.left: selectAllCheckbox.right;
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;
		anchors.leftMargin: 15;
		font.pixelSize: 24;
		placeholder.text: "What needs to be done?";
		placeholder.color: "#e6e6e6";
		placeholder.font.italic: true;
		color: "#4d4d4d";
	}
}
