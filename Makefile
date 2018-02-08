# In order to run one python test:
# $ docker run --rm -it -v $PWD:/home/ronaldo/.dotfiles dotfiles-test python3 test/integration/dev_tools_test.py
run_unit_tests=python3 -m unittest discover -s test/unit/ -p '*_test.py'
run_integration_tests=python3 -m unittest discover -s test/integration/ -p '*_test.py'

.PHONY: install
install:
	./install/apt-packages.sh
	sudo ./install/dev_tools.py
	./setup_symlinks.py

.PHONY: build
build:
	docker build -t dotfiles-test -f Dockerfile.test .

.PHONY: unit
unit: build
	docker run --rm -v $(shell pwd):/home/ronaldo/.dotfiles dotfiles-test $(run_unit_tests)

.PHONY: integration
integration: build
	docker run --rm -v $(shell pwd):/home/ronaldo/.dotfiles dotfiles-test $(run_integration_tests)

# Interactively run tests in a bash session
.PHONY: test-i
test-i: build
	docker run --rm -it -v $(shell pwd):/home/ronaldo/.dotfiles dotfiles-test bash

.PHONY: test
test: build unit integration

