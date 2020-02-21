#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# import certificate
security create-keychain -p $KEYCHAIN_PASSWORD "${DIR}/appbuilder/appbuilder.keychain"
security import "${DIR}/appbuilder/secrets/Certificates.p12" -t agg -k "${DIR}/appbuilder/appbuilder.keychain" -P $CERTIFICATE_PASSWORD -A

# set keychain
security list-keychains -s "${DIR}/appbuilder/appbuilder.keychain"
security default-keychain -s "${DIR}/appbuilder/appbuilder.keychain"
security unlock-keychain -p "${KEYCHAIN_PASSWORD}" "${DIR}/appbuilder/appbuilder.keychain"

# resign app
./resign.sh asset/WEB-1.4.ipa "iPhone Distribution: Chris Hubbard (5P99T946M7)" -p "${DIR}/appbuilder/secrets/app.mobileprovision" asset/WEB-1.4-resigned.ipa

