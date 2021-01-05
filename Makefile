.PHONY: run 
run: build
	./main

.PHONY: test
test: build
	./main --test

.PHONY: build
build: main

.PHONY: clean
clean:
	rm -f main

main: main.swift AnyEquatable.swift AnyEquatableTests.swift
	swiftc -F $(FRAMEWORKS) -Xlinker -rpath -Xlinker $(FRAMEWORKS) main.swift AnyEquatable.swift AnyEquatableTests.swift

.DEFAULT_GOAL := build

FRAMEWORKS = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks