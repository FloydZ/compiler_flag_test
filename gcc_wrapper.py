from subprocess import Popen, PIPE, STDOUT
from itertools import combinations
from typing import Callable
import os
import re


GCC_BIN = "/usr/bin/g++"


def power_set(s):
    """
    yields a power set
    """
    n = len(s)

    yield ()
    for r in range(1, n+1):
        for combo in combinations(s, r):
            yield combo


def rebuild(target: str, dir: str, optimisations: str, CFLAGS=""):
    """
    rebuild either a 'Make' or 'CMake' project
    """

    # first clear the target
    p = Popen(["make", "clean"], stdout=PIPE, stderr=STDOUT, cwd=dir)
    p.wait()

    cmd = ["make", "C_FLAGS = " + CFLAGS + optimisations, target, "-j1"]
    p = Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True,
            cwd=dir)

    p.wait()
    if p.returncode != 0:
        print("ERROR Build", p.returncode, p.stdout.read().decode("utf-8"))

    data = p.stdout.readlines()
    data = [str(a).replace("b'", "")
                  .replace("\\n'", "")
                  .lstrip() for a in data]
    return p.returncode, data


def gcc_execute_command(flag: str):
    p = Popen([GCC_BIN, flag], stdout=PIPE)
    p.wait()
    output = p.stdout.readlines()

    # the first replace, removes b' from each string
    # the second removes all the unecessery \\b
    # and the last lstrip removes leading whitespaces.
    return [str(a).replace("b'", "")
            .replace("\\n'", "")
            .lstrip() for a in output]


def get_gcc_optimizer_stuff_descriptions(opt):
    """
    opt =
        "--help=optimizer"
        "--help=params"
    """
    if opt not in ["optimizer", "params"]:
        return []

    commands = gcc_execute_command("--help=" + opt)

    # this split() reduces multiple whitespaces to one
    list = [' '.join(a.split()) for a in commands]

    # this splits every string into two oart on the first whitespace
    cmd_info = [a.split(" ", 1) for a in list]
    return cmd_info


def get_gcc_optimizer_flags():
    list = get_gcc_optimizer_stuff_descriptions("optimizer")
    return [a[0] for a in list]


def get_gcc_params_flags():
    """
    TODO params range returnrn
    """
    list = get_gcc_optimizer_stuff_descriptions("params")
    return [a[0] for a in list]


def run(target: str, dir: str, optimisations: str, set_of_flags,
        parse: Callable):

    timings = []
    for flags in power_set(set_of_flags):
        cmd_flags = " ".join(flags) + " "
        print("Flags: ", cmd_flags)
        returncode, data = rebuild(target, dir, optimisations, cmd_flags)
        if returncode != 0:
            print("ERROR build data", data)
            return

        cmd = ["./" + target]
        p = Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=STDOUT,
                  preexec_fn=os.setsid, cwd=dir)
        p.wait()

        if p.returncode != 0:
            print("ERROR RUN: ", p.stdout.read())
            continue
        data = p.stdout.readlines()
        data = [str(a).replace("b'", "")
                      .replace("\\n'", "")
                      .lstrip() for a in data]
        time = parse(data)
        timings.append(time)

    print(timings)


def test_parse(lines: list[str]):
    if len(lines) == 0:
        return 0.0

    lastline = lines[-1]
    matches = re.findall("([+-]?([0-9]*[.])?[0-9]+)", lastline)
    print(matches)
    if len(matches) == 0:
        return 0.0
    return matches[0][0]


# rebuild("example_c", "test", "-O3")
# get_gcc_optimizer_flags_descriptions()
run("example_c", "test", "-O2",
    ["--param=selsched-max-lookahead=1",
     "--param=max-pipeline-region-blocks=1"], test_parse)
