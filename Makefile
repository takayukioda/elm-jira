OUTPUT_FILENAME = main

MAIN_FILE = ./src/Main.elm

.PHONY: fmt clean build pack run

fmt:
	npx elm-format --yes .
clean:
	rm -rf elm-stuff $(OUTPUT_FILE)
build:
	elm make $(MAIN_FILE) --output="$(OUTPUT_FILENAME).js"
pack:
	elm make $(MAIN_FILE) --optimize --output="$(OUTPUT_FILENAME).pack.js"
run:
	elm reactor
