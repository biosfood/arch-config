#!/bin/bash
initdb --locale en_US.UTF-8 -D '/home/lukas/postgres/data'
sudo mkdir /run/postgresql
sudo chown lukas /run/postgresql/
pg_ctl -D /home/lukas/postgres/data start
