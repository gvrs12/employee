#!/bin/bash

set -e -u

cd dev-src
mvn clean -DskipTests package
#cf login -a https://api.sys.cfnp-1.gaig.com -o developers -s sguddeti -u sguddeti -p Venkat@boduppal2009 --skip-ssl-validation
cf login -a "${pcf_api_endpoint_uri}" -o "${pcf_org_name}" -s "${pcf_space_name}" -u "${pcf_account_username}" -p "${pcf_account_password}" --skip-ssl-validation
cf target "${pcf_org_name}" -s "${pcf_space_name}"
cf push helloworld-sguddeti
