#!/bin/bash

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

CURRENT_PATH="$(pwd)"

FACTORY=$CURRENT_PATH"/app/factory"
FACTORY_TESTS=$CURRENT_PATH"/tests/factory"

if [ ! -d $FACTORY ]; then
	echo "Creating  "$FACTORY"..."
	mkdir -p $FACTORY
fi;


if [ ! -d $FACTORY_TESTS ]; then
	echo "Creating  "$FACTORY_TESTS"..."
	mkdir -p $FACTORY_TESTS
fi;

echo "'use strict';

app.factory('\$${1^}', ['\$scope', '\$log', function(\$scope, \$log) {
	var ${1^} = function() {

	};

	/*${1^}.prototype.method = function() {

	}*/

	return ${1^};
}]);" > $FACTORY"/"$1".js"


echo "'use strict';

describe('Factory \$${1^}', function() {
		beforeEach(function() {

		});

		afertEach(function() {

		});

    it('method: comment', function() {

    });
});" > $FACTORY_TESTS"/"$1".js"
