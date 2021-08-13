all:
	tuist generate
	pod install
	make gen

sync:
	tuist generate
	make gen

gen:
	needle generate Projects/Dodi/Sources/NeedleGenerated.swift Projects/
