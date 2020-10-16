#!/bin/bash

set -e -u

cd dev-src
mvn clean -DskipTests package
#cf login -a https://api.sys.cfnp-1.gaig.com -o developers -s sguddeti -u sguddeti -p Venkat@boduppal2009 --skip-ssl-validation
cf login -a "${pcf_api_endpoint_uri}" -o "${pcf_org_name}" -s "${pcf_space_name}" -u "${pcf_account_username}" -p "${pcf_account_password}" --skip-ssl-validation
cf map-route "helloworld-sguddeti" "app.cfnp-1.gaig.com" -n "helloworld-sguddeti.app.cfnp-1.gaig.com" --path "target/employee-producer-0.0.1-SNAPSHOT.jar"
cf push helloworld-sguddeti -p target/employee-producer-0.0.1-SNAPSHOT.jar
