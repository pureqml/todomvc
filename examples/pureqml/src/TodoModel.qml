ListModel {
	toggleDone(idx): {
		var done = this.get(idx).done
		this.setProperty(idx, "done", !done)
	}
}
