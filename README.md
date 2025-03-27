# cd-project

## About

This is a simple C compiler implemented using the following tools:
- clang
- llvm
- flex
- yacc

## Get the code

The code is publicly available on Github [here](https://github.com/aerocyber/cd-project).


Get the code by:
```bash
git clone https://github.com/aerocyber/cd-project
```

## Running condition

This project is VERY minimal to the point that no programs other than the test/test.c is guaranteed to compile. This compiler is VERY minimal and supposed to be treated as a proof of concept.

## Build Requirements
The following dependencies are required for building the project
- clang
- LLVM 19
- flex
- yacc

## Build Instructions
If building for the first time,

- Get the code. See [#Get the code](#get-the-code)
- Run `build.sh`:
```bash
./build.sh
```

- Run the test file:
```bash
./test.sh
```

- Cleanup:
```bash
./clean.sh
```

## License

See [LICENSE file](LICENSE)
