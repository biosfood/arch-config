#!/bin/bash
initdb --locale en_US.UTF-8 -D ~/postgres/data
sudo mkdir /run/postgresql
sudo chown lukas /run/postgresql/
pg_ctl -D ~/postgres/data start
