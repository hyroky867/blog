#!/bin/bash

docker-compose exec app sh /work/bin/phpunit-test.sh --no-coverage ${@}
