#!/bin/bash

/etc/init.d/postgresql start
python3 /Python_scripts/postgres_update.py
python3 /Python_scripts/test.py

