Rectangle {
	anchors.fill: context;
	color: "#f5f5f5";

	Text {
		id: header;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: 10;
		font.pixelSize: 100;
		text: "todos";
		color: "#B12F2F26";
	}

	Column {
		width: 550;
		anchors.top: header.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: 5;
		effects.shadow.y: 2;
		effects.shadow.x: -1;
		effects.shadow.blur: 20;
		effects.shadow.color: "#0002";

		TodoInput {}
	}
}
