.PHONY: run 
run: build
	./main

.PHONY: test
test:
	# TODO

.PHONY: build
build: main

.PHONY: clean
clean:
	rm main

main: 
	swiftc main.swift AnyEquatable.swift

.DEFAULT_GOAL := run
