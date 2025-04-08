PYTHON = .venv/bin/python
PIP = .venv/bin/pip

.PHONY: help init install lint format test clean

help:
	@echo "make init     - create virtualenv and install requirements"
	@echo "make install  - install requirements into existing .venv"
	@echo "make lint     - run flake8 and mypy"
	@echo "make format   - run black and isort"
	@echo "make test     - run pytest"
	@echo "make clean    - remove .venv and __pycache__"

init:
	python3 -m venv .venv
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

install:
	$(PIP) install -r requirements.txt

lint:
	.venv/bin/flake8 src
	.venv/bin/mypy src

format:
	.venv/bin/black src
	.venv/bin/isort src

test:
	.venv/bin/pytest

clean:
	rm -rf .venv __pycache__ src/__pycache__
