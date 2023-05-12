HelloASM: HelloASM.o
	ld -o HelloASM HelloASM.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

HelloASM.o: HelloASM.s
	as -arch arm64 -o HelloASM.o HelloASM.s
