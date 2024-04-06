all:	librouteros.o librouteros.so librouteros.a

examples: librouteros.o librouteros.h
	make -C examples all

librouteros.o: librouteros.c librouteros.h
	gcc -Wall -Wall -g -fPIC -c -o librouteros.o librouteros.c

md5.o: md5.c
	gcc -Wall -Wall -g -fPIC -c -o md5.o md5.c

librouteros.so: librouteros.o md5.o
	gcc -Wall -Wall -g -shared -o librouteros.so librouteros.o md5.o

librouteros.a: librouteros.o md5.o
	ar -rc librouteros.a *.o

install: librouteros.so librouteros.a
	cp librouteros.so /usr/lib/
	cp librouteros.a /usr/lib/
	cp librouteros.h /usr/include/

clean:
	rm -f *.a *.o *.so
	make -C examples clean
