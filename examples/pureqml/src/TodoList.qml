ListView {
	property string filterMode;
	height: contentHeight;
	anchors.left: parent.left;
	anchors.right: parent.right;
	anchors.topMargin: 1;
	model: ProxyModel {
		target: todoModel;

		function filter(item) {
			switch (this.parent.filterMode) {
			case 'Active':
				return !item.done
			case 'Completed':
				return item.done
			case 'All':
			default:
				return true
			}
		}

		onCompleted: { this.setFilter(this.filter) }
	}
	delegate: TodoDelegate {
		onRemove(idx): { this.parent.remove(idx) }
		onEdit(idx, text): { this.parent.edit(idx, text) }
		onToggleDone(idx): { this.parent.toggleDone(idx) }
	}

	onFilterModeChanged: { this.model.rebuild() }

	remove(idx): { this.model.remove(idx); }

	edit(idx, text): {
		this.model.setProperty(idx, "text", text)
		this.model.target.update()
	}

	toggleDone(idx): {
		var done = this.model.get(idx).done
		this.model.setProperty(idx, "done", !done)
		this.model.target.update()
	}
}
