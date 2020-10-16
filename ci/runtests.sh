#!/bin/bash

set -e -u

cd dev-src
mvn clean test
