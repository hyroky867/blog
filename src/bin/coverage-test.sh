#!/bin/bash

docker-compose exec app /var/www/html/src/bin/phpdbg-test.sh ${@}
