#!/bin/bash

CURRENT_PATH="$(pwd)"

CONTROLLER=$CURRENT_PATH"/development/app/controllers"
CONTROLLER_TESTS=$CURRENT_PATH"/tests/controllers"

if [ ! -f $CONTROLLER"/"$1".js" ];
then
    sed "/\#controllers/a \\\t\t\t'development/app/controllers/"$1".js'" $CURRENT_PATH"/Gruntfile.coffee" > $CURRENT_PATH"/Gruntfile.coffee.back"

    if [ ! -f $CURRENT_PATH"/Gruntfile.coffee.back" ];
    then
        echo "Gruntfile not found!"
    else
        rm $CURRENT_PATH"/Gruntfile.coffee"
        mv $CURRENT_PATH"/Gruntfile.coffee.back" $CURRENT_PATH"/Gruntfile.coffee"
    fi;

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
else
    echo "The controller "$1" already exist!"
fi;
