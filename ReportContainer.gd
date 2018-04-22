extends VBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var scene = preload("ReportFile.tscn")
	var report = scene.instance()
	add_child(report)
	report = scene.instance()
	add_child(report)
	report = scene.instance()
	add_child(report)
	pass

func _onReportCreationAsked():
	var scene = preload("ReportFile.tscn")
	var report = scene.instance()
	add_child(report)
	