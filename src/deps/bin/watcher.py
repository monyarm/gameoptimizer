#!/bin/python3
import sys
import io
import select
from subprocess import Popen, PIPE, DEVNULL, STDOUT
from sys import argv

def kill_when_found(process, needle, size = io.DEFAULT_BUFFER_SIZE):
    if isinstance(needle, str):
        needle = needle.encode()
    assert isinstance(needle, bytes)

    stream = process.stderr
    assert stream is not None

    poll = select.poll()
    poll.register(stream, select.POLLIN)

    output_buffer = b''
    while process.poll() is None:
        result = poll.poll(100)
        if not result:
            continue

        output = stream.read1(size)
        sys.stdout.buffer.write(output)
        output_buffer += output
        if needle in output_buffer:
            process.kill()
            return process.poll()

        if len(output_buffer) >= len(needle):
            output_buffer = output_buffer[-len(needle):]

    return process.poll()

if __name__ == '__main__':
    if len(argv) <= 3:
        print("""
Usage: Pass in at least 2 arguments, the first argument is the search
string;
the remaining arguments form the command to be executed (and watched over).
""")
        sys.exit(0)
    else:
        process = Popen(argv[2:], stderr = PIPE)
        retcode = kill_when_found(process, argv[1])
        sys.exit(retcode)
