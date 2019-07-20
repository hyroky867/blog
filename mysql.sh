#!/bin/bash

docker-compose exec db bash -c 'mysql -uroot -proot blog'
