#!/bin/sh

if [ -z $1 ]; then
    echo "Usage:"
    echo "  ./run-hawtio-app.sh <path to hawtio-app.jar>"
    exit 1
fi

JAVA_OPTIONS="$JAVA_OPTIONS -Dhawtio.authenticationEnabled=true"
JAVA_OPTIONS="$JAVA_OPTIONS -Dhawtio.realm=hawtio -Dhawtio.keycloakEnabled=true"
JAVA_OPTIONS="$JAVA_OPTIONS -Dhawtio.roles=admin,viewer"
JAVA_OPTIONS="$JAVA_OPTIONS -Dhawtio.rolePrincipalClasses=org.keycloak.adapters.jaas.RolePrincipal"
JAVA_OPTIONS="$JAVA_OPTIONS -Dhawtio.keycloakClientConfig=keycloak-hawtio-client.json"
JAVA_OPTIONS="$JAVA_OPTIONS -Dhawtio.keycloakServerConfig=keycloak-hawtio.json"
JAVA_OPTIONS="$JAVA_OPTIONS -Djava.security.auth.login.config=login.conf"

echo java $JAVA_OPTIONS -jar $1
java $JAVA_OPTIONS -jar $1
