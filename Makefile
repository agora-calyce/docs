ZENSICAL ?= docker run --rm -it -p 8000:8000 -v "$(CURDIR)":/docs zensical/zensical:0.0.57
MDLINT ?= docker run --rm -v "$(CURDIR)":/workdir davidanson/markdownlint-cli2:v0.18.1

.PHONY: serve build lint-md format-md

# Serve the site locally on http://localhost:8000
serve:
	$(ZENSICAL) serve -a 0.0.0.0:8000

# Build the site in site/ (fails on warnings)
build:
	$(ZENSICAL) build --strict

# Check Markdown list formatting (config: .markdownlint-cli2.yaml)
lint-md:
	$(MDLINT)

# Fix Markdown list formatting in place
format-md:
	$(MDLINT) --fix
