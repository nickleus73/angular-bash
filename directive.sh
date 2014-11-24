#!/bin/bash

CURRENT_PATH="$(pwd)"

DIRECTIVES=$CURRENT_PATH"/app/directives"
DIRECTIVES_TESTS=$CURRENT_PATH"/tests/directives"

if [ ! -d $DIRECTIVES ]; then
	echo "Creating  "$DIRECTIVES"..."
	mkdir -p $DIRECTIVES
fi;


if [ ! -d $DIRECTIVES_TESTS ]; then
	echo "Creating  "$DIRECTIVES_TESTS"..."
	mkdir -p $DIRECTIVES_TESTS
fi;

echo "'use strict';

app.directive('$1', function() {
		return {
				retricted: 'E'
		}
});" > $DIRECTIVES"/"$1".js"


echo "'use strict';

describe('Directive $1', function() {
		var \$compile, \$rootScope;

		beforeEach(module('app'));

		beforeEach(inject(function(_\$compile_, _\$rootScope_) {
				\$compile = _\$compile_;
				\$rootScope = _\$rootScope_;
		}));

    it('directive', function() {
        var element = \$compile('code')(\$rootScope);

				\$rootScope.\$digest();

				// exect(element.html()).toContain('content');
    });
});" > $DIRECTIVES_TESTS"/"$1".js"
