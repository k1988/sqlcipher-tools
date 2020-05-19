SQLITEDIR = ../sqlcipher

#CFLAGS = -g -DSQLITE_TEMP_STORE=2  -DSQLITE_HAS_CODEC -DSQLITE_OS_UNIX=1 -DSQLITE_THREADSAFE=1

CFLAGS = -I$(SQLITEDIR)  -DSQLITE_TEMP_STORE=2  -DSQLITE_HAS_CODEC -DSQLITE_OS_UNIX=1 -DSQLITE_THREADSAFE=1
LDFLAGS = -ldl -lpthread -lcrypto -lsqlcipher
CC = gcc

all: decrypt load attach autovacuum-test backuptest \
	exportencrypt loadtest open-load verify

.o:.c
	$(CC) $(CFLAGS) -c $^ -o $@

decrypt: decrypt.o
	gcc $^ $(LDFLAGS) -o $@

load: load.o
	gcc $^ $(LDFLAGS) -o $@

attach:attach.o
	gcc $^ $(LDFLAGS) -o $@

autovacuum-test:autovacuum-test.o
	gcc $^ $(LDFLAGS) -o $@

backuptest:backuptest.o
	gcc $^ $(LDFLAGS) -o $@

exportencrypt:exportencrypt.o
	gcc $^ $(LDFLAGS) -o $@

loadtest:loadtest.o
	gcc $^ $(LDFLAGS) -o $@

open-load:open-load.o
	gcc $^ $(LDFLAGS) -o $@

verify:verify.o
	gcc $^ $(LDFLAGS) -o $@


clean:
	rm -rf $(OBJS) *.dSYM *.db load decrypt attach autovacuum-test backuptest \
	exportencrypt loadtest open-load verify


#gcc -I../sqlcipher  -lcrypto -lsqlcipher -ldl -lpthread -g -DSQLITE_TEMP_STORE=2  -DSQLITE_HAS_CODEC -DSQLITE_OS_UNIX=1 -DSQLITE_THREADSAFE=1 decrypt.c -o decrypt

# 手动编译成功
#gcc  -I../sqlcipher -DSQLITE_TEMP_STORE=2  -DSQLITE_HAS_CODEC -DSQLITE_OS_UNIX=1 -DSQLITE_THREADSAFE=1 decrypt.c -lcrypto -ldl -lpthread -o decrypt

# 规则
#gcc $(INCS) $(CFLAGS) load.c  $(LDFLAGS) -o load