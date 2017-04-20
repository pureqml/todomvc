ListModel {
	signal save;
	property int todoCount;
	property string name: "todoItems";

	toggleDone(idx): {
		var done = this.get(idx).done
		this.setProperty(idx, "done", !done)
		this.update()
	}

	onReset: { this.update() }
	onRowsRemoved: { this.update() }
	onRowsInserted: { this.update() }

	buildModel(data): {
		if (data && data.rows)
			this.append(data.rows)
	}

	update: {
		this.save()

		var todo = 0
		for (var i = 0; i < this.count; ++i)
			if (!this._rows[i].done)
				++todo
		this.todoCount = todo
	}
}
