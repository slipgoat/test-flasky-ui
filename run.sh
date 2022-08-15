#!/bin/bash

pip3.9 install poetry
mkdir .venv && poetry config virtualenvs.in-project=true
poetry env use python3.9
source .venv/bin/activate
poetry update
webdrivermanager firefox chrome
pabot --testlevelsplit --processes 5 --outputdir results tests/
deactivate