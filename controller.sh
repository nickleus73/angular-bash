#!/bin/bash

CURRENT_PATH="$(pwd)"

CONTROLLER=$CURRENT_PATH"/app/controllers"
CONTROLLER_TESTS=$CURRENT_PATH"/tests/controllers"

if [ ! -d $CONTROLLER ]; then
	echo "Creating  "$CONTROLLER"..."
	mkdir -p $CONTROLLER
fi;


if [ ! -d $CONTROLLER_TESTS ]; then
	echo "Creating  "$CONTROLLER_TESTS"..."
	mkdir -p $CONTROLLER_TESTS
fi;

echo "'use strict';

app.controller('$1', ['\$scope', '\$log', function(\$scope, \$log) {

}]);" > $CONTROLLER"/"$1".js"


echo "'use strict';

describe('Controller: $1', function() {
		var \$controller;

		beforeEach(module('app'));

		beforeEach(function(_\$controller_) {
			\$controller = _\$controller_;
		});

    it('method: comment', function() {
        var \$scope = {}
				var controller = \$controller('$1', { \$scope: \$scope });

				// expect('compare').toEqual('sample');
    });
});" > $CONTROLLER_TESTS"/"$1".js"
