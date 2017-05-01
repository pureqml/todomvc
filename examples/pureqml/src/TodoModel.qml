ListModel {
	signal save;
	property int todoCount;
	property int doneCount;
	property string name: "todoItems";

	onReset: { this.update() }
	onRowsRemoved: { this.update() }
	onRowsInserted: { this.update() }

	buildModel(data): {
		if (data && data.rows)
			this.append(data.rows)
	}

	toggleAll: {
		var allItemsCompleted = this.count == this.doneCount
		var nothingCompleted = this.count == this.todoCount
		if (allItemsCompleted || nothingCompleted) {
			for (var i = 0; i < this.count; ++i)
				this.setProperty(i, "done", nothingCompleted)
			this.reset()
		}
	}

	clearCompleted: {
		var last = this.count - 1
		for (var i = last; i >= 0; --i)
			if (this._rows[i].done)
				this.remove(i)
	}

	update: {
		this.save()

		var todo = 0
		for (var i = 0; i < this.count; ++i)
			if (!this._rows[i].done)
				++todo
		this.doneCount = this.count - todo
		this.todoCount = todo
	}
}
