#!/bin/bash

CURRENT_PATH="$(pwd)"

FILTER=$CURRENT_PATH"/development/app/filters"
FILTER_TESTS=$CURRENT_PATH"/tests/filters"

if [ ! -f $FILTER"/"$1".js" ];
then
    sed "/\#filters/a \\\t\t\t'development/app/filters/"$1".js'" $CURRENT_PATH"/Gruntfile.coffee" > $CURRENT_PATH"/Gruntfile.coffee.back"

    if [ ! -f $CURRENT_PATH"/Gruntfile.coffee.back" ];
    then
        echo "Gruntfile not found!"
    else
        rm $CURRENT_PATH"/Gruntfile.coffee"
        mv $CURRENT_PATH"/Gruntfile.coffee.back" $CURRENT_PATH"/Gruntfile.coffee"
    fi;

    if [ ! -d $FILTER ]; then
        echo "Creating  "$FILTER"..."
        mkdir -p $FILTER
    fi;

    if [ ! -d $FILTER_TESTS ]; then
        echo "Creating  "$FILTER_TESTS"..."
        mkdir -p $FILTER_TESTS
    fi;

    echo "'use strict';

    app.filter('$1', function() {
            return function(param) {
                    return '';
            }
    });" > $FILTER"/"$1".js"


    echo "'use strict';

    describe('Filter: $1', function() {
        it('return value', function() {
            var filter = $filter('$1');

                    // expect(filter('param')).toEqual('return');
        });
    });" > $FILTER_TESTS"/"$1".js"
fi;
