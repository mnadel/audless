queue:
	sqlite3 audless.db "select * from queue order by rank"

backup:
	sqlite3 audless.db .dump

.PHONY: queue
