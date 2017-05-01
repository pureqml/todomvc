Rectangle {
	anchors.fill: context;
	color: "#f5f5f5";

	JsonStorage {
		id: storage;

		onLoaded: {
			todoModel.buildModel(this.getValue(todoModel.name))
			todoStatus.setFilter(this.getValue(todoStatus.name))
		}
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

	Item {
		anchors.fill: content;
		anchors.topMargin: 20;
		anchors.bottomMargin: 10;
		effects.shadow.y: 22;
		effects.shadow.blur: 50;
		effects.shadow.spread: 5;
		effects.shadow.color: "#00000015";
	}

	Column {
		id: content;
		width: 550;
		anchors.top: header.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: 5;
		radius: 40;

		TodoInput {
			onAddTodo(text): { todoModel.append({ text: text, done: false }) }
		}

		TodoList {
			id: todoList;

			filterMode: todoStatus.filter;
		}

		TodoStatus {
			id: todoStatus;
			visible: todoModel.count;
			todoCount: todoModel.todoCount;

			onFilterChanged: { storage.setValue(this.name, { value: this.filter }) }
		}
	}

	Footer {
		anchors.top: content.bottom;
		anchors.topMargin: todoModel.count ? 54 : 63;
	}
}
