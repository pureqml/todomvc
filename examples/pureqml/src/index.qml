Rectangle {
	anchors.fill: context;
	color: "#f5f5f5";

	JsonStorage {
		id: storage;

		onLoaded: { todoModel.buildModel(this.getValue(todoModel.name)) }
	}

	TodoModel {
		id: todoModel;

		onSave: { storage.setValue(this.name, { rows: this._rows }) }
	}

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
		id: content;
		width: 550;
		anchors.top: header.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: 5;
		effects.shadow.y: 10;
		effects.shadow.blur: 30;
		effects.shadow.spread: 5;
		effects.shadow.color: "#00000015";
		radius: 10;

		TodoInput { onAddTodo(text): { todoModel.append({ text: text, done: false }) } }

		TodoList { id: todoList; filterMode: status.filter; }

		TodoStatus {
			id: status;

			todoCount: todoModel.todoCount;
		}
	}

	Footer {
		anchors.top: content.bottom;
		anchors.topMargin: 64;
	}
}
