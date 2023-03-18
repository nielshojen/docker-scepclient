#!/bin/sh

/bin/echo "Running scepclient ..."

execServe="/usr/local/bin/scepclient"

# SHA-256 digest of CA certificate for NDES server. Note: Changed from MD5.
if [[ ${CA_FINGERPRINT} ]]; then
  execServe="${execServe} -ca-fingerprint ${CA_FINGERPRINT}"
fi

# certificate path, if there is no key, scepclient will create one
if [[ ${CERTIFICATE} ]]; then
  execServe="${execServe} -certificate ${CERTIFICATE}"
fi

# enforce a challenge password
if [[ ${CHALLENGE} ]]; then
  execServe="${execServe} -challenge ${CHALLENGE}"
fi

# common name for certificate (default "scepclient")
if [[ ${CN} ]]; then
  execServe="${execServe} -cn ${CN}"
fi  	

# country code in certificate (default "US")
if [[ ${COUNTRY} ]]; then
  execServe="${execServe} -country ${COUNTRY}"
fi    	

# enable debug logging
if [[ ${DEBUG} ]]; then
  execServe="${execServe} -debug ${DEBUG}"
fi  	

# rsa key size (default 2048)
if [[ ${KEYSIZE} ]]; then
  execServe="${execServe} -keySize ${KEYSIZE}"
fi
    	

# locality for certificate
if [[ ${LOCALITY} ]]; then
  execServe="${execServe} -locality ${LOCALITY}"
fi

# use JSON for log output
if [[ ${LOG_JSON} = "true" ]]; then
  execServe="${execServe} -log-json"
fi

# organization for cert (default "scep-client")
if [[ ${ORGANIZATION} ]]; then
  execServe="${execServe} -organization ${ORGANIZATION}"
fi  	

# organizational unit for certificate (default "MDM")
if [[ ${OU} ]]; then
  execServe="${execServe} -ou ${OU}"
fi

# private key path, if there is no key, scepclient will create one
if [[ ${PROVATE_KEY} ]]; then
  execServe="${execServe} -private-key ${PROVATE_KEY}"
fi

# province for certificate
if [[ ${PROVINCE} ]]; then
  execServe="${execServe} -province ${PROVINCE}"
fi

# SCEP server url
if [[ ${SERVER_URL} ]]; then
  execServe="${execServe} -server-url ${SERVER_URL}"
fi

echo "Running using: $execServe"

eval $execServe
