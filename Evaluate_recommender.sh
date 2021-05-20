#!/usr/bin/env bash

BIN="./evaluation"
EVALBASE="../../testdata/latest-truthy-item-filtered-sorted-1in10000" 
COMMON="-results -testSet $EVALBASE-test.nt.gz"

TYPEDBACKOFFTREE="-model $EVALBASE-train.nt.gz.schemaTree.typed.bin -typed -workflow Wiki_backoff.json"


TAKEITER="-handler takeMoreButCommon"
BYNONTYPES="-groupBy numNonTypes"
BYSETSIZE="-groupBy setSize"

go build .
./SchemaTreeRecommender build-tree-typed ../testdata/latest-truthy-item-filtered-sorted-1in10000-train.nt.gz

cd evaluation
go build .
$BIN $COMMON $TYPEDBACKOFFTREE $TAKEITER $BYSETSIZE -name original-typed-tooFewRecs-takeMoreButCommon-setSize

$BIN $COMMON $TYPEDBACKOFFTREE $TAKEITER $BYNONTYPES -name original-typed-tooFewRecs-takeMoreButCommon-byNonTypes