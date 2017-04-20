ListModel {
	signal save;
	property string name: "todoItems";

	toggleDone(idx): {
		var done = this.get(idx).done
		this.setProperty(idx, "done", !done)
		this.save()
	}

	onReset: { this.save() }
	onRowsRemoved: { this.save() }
	onRowsInserted: { this.save() }

	buildModel(data): {
		if (data && data.rows)
			this.append(data.rows)
	}
}
