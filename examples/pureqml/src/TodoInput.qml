Rectangle {
	signal addTodo;
	height: 65;
	anchors.left: parent.left;
	anchors.right: parent.right;
	color: "#fff";
	focus: true;

	Text {
		id: selectAllCheckbox;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.topMargin: 24;
		anchors.leftMargin: 17;
		font.pixelSize: 22;
		color: "#e6e6e6";
		transform.rotate: 90;
		text: "❯";
		visible: todoModel.count;
	}

	TextInput {
		id: todoInput;
		anchors.top: parent.top;
		anchors.left: selectAllCheckbox.right;
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;
		anchors.leftMargin: 25;
		font.pixelSize: 24;
		placeholder.text: "What needs to be done?";
		placeholder.color: "#e6e6e6";
		placeholder.font.italic: true;
		color: "#4d4d4d";
	}

	onSelectPressed: {
		if (todoInput.text) {
			this.addTodo(todoInput.text)
			todoInput.text = ""
		}
	}
}
