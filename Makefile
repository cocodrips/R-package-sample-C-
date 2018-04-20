build: src/triple.c src/triple_cpp.cpp
	if [ ! -d lib ]; then mkdir lib; fi
	R CMD SHLIB --preclean --clean -o lib/triple.so src/triple.c 
	R CMD SHLIB --preclean --clean -o lib/triple_cpp.so src/triple_cpp.cpp
	R CMD SHLIB --preclean --clean -o lib/triple_vector.so src/triple_vector.cpp

clean:
	if [ -d lib ]; then rm -rf lib; fi

