#!/bin/bash

set -x
brew install czmq
swift package update
swift build -Xcc '-I/usr/local/include' -Xlinker '-L/usr/local/lib'
cat > iSwiftKernel/kernel.json  <<HERE
{
 "argv": ["$PWD/.build/debug/iSwift", "-f", "{connection_file}"],
 "display_name": "Swift",
 "language": "swift"
}
HERE

echo Installing Swift Kernel
jupyter-kernelspec install $PWD/iSwiftKernel
