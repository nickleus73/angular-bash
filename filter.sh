#!/bin/bash

CURRENT_PATH="$(pwd)"

FILTER=$CURRENT_PATH"/app/filters"
FILTER_TESTS=$CURRENT_PATH"/tests/filters"

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
