#!/bin/bash
# BASH DUMPSTER FIRE TO RETRIEVE OIDC PROVIDER SSL CERT SHA1 FGPRINT
# Unfortunately, this is hardly doable in python3 since std ssl module doesnt properly implem a get_cert_chain()
set -e
URL=oidc.eks.${1}.amazonaws.com
THUMBPRINT=$(echo | openssl s_client -servername $URL -showcerts -connect ${URL}:443 2>/dev/null | tac | sed -n '/-----END CERTIFICATE-----/,/-----BEGIN CERTIFICATE-----/p; /-----BEGIN CERTIFICATE-----/q' | tac | openssl x509 -fingerprint -noout | sed 's/://g' | awk -F= '{print tolower($2)}')
THUMBPRINT_JSON="{\"thumbprint\": \"${THUMBPRINT}\"}"
echo $THUMBPRINT_JSON