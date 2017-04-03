// Run from file with `io Day2-3.io`
/*
List has a lot of this stuff baked in; slotNames shows it has a flatten function and a sum function

Io> List slotNames
==> list(removeAll, with, mapInPlace, reduce, sortByKey, appendIfAbsent, unique, insertAfter, first, removeAt, last, at, detect, difference, sort, sortBy, reverseReduce, append, sortKey, empty, cursor, removeSeq, asJson, uniqueCount, max, join, sliceInPlace, size, asEncodedList, containsAll, min, copy, containsIdenticalTo, second, asSimpleString, intersect, select, rest, isNotEmpty, flatten, isEmpty, insertAt, slice, swapIndices, contains, groupBy, asMessage, push, setSize, asString, appendSeq, average, pop, justSerialized, atPut, foreach, map, reverseInPlace, union, sum, containsAny, indexOf, preallocateToSize, sortInPlace, insertBefore, prepend, reverse, itemCopy, selectInPlace, remove, asMap, atInsert, fromEncodedList, reverseForeach, ListCursor, sortInPlaceBy, exSlice, removeFirst, capacity, third, removeLast, mapFromKey)
*/

addUp2D := method(array,
	array flatten sum
)

addUp2D(list(list(1,2,3),1,list(4,5,6),2,list(7,8,9))) println
addUp2D(list(list(9,9,9),9,list(9,9),9,list(9,9,9))) println
addUp2D(list(list(1),1,list(1,2),2,list(1,2,3),3)) println