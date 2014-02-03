# redis-moveby

This is a redis lua script to move an item forwards or backwards in a list.

A sorted set may be a better solution to this problem, so you should consider using a sorted set before using this.
I have not used this in production, so beware.


## Usage

Call this script with one key and two arguments:

* The list key
* The item you wish to move
* The number of positions you wish to move (positive or negative)

The script returns the index of the item AFTER the move (with zero based indexing).
Calling LINDEX with the return value would give you the item.


## Examples

`test.sh` provdes an example usage.  Run it with a day name and a number:

`./test.sh friday -2` produces:

```
1) "monday"
2) "tuesday"
3) "friday"
4) "wednesday"
5) "thursday"
6) "saturday"
7) "sunday"
```


## See Also

* http://stackoverflow.com/questions/19173684/redis-move-item-from-middle-of-list-to-top