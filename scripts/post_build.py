import post_build_asm

Import("env", "projenv")

fw_filename = "reference/firmware.S"
sz_filename = "reference/size.txt"

make_asm = "avr-objdump -C -d ./.pio/build/feather32u4/firmware.elf > "+fw_filename
get_size = "avr-nm -S -r -C --size-sort -t d ./.pio/build/feather32u4/firmware.elf | sed 's/[0-9]* //' > "+sz_filename


def sort_lines(filename: str):
    lines = []
    with open(filename, "r") as input_file:
        for line in input_file:
            lines.append(line)
    sorted_lines = sorted(lines, reverse=True)
    with open(filename, "w") as output_file:
        for line in sorted_lines:
            output_file.write(line)


def after_build(source, target, env):
    ret = env.Execute(make_asm)

    if ret == 0:
        post_build_asm.do(fw_filename, fw_filename)
        env.Execute(get_size)
        sort_lines(sz_filename)
    else:
        env.Execute("rm -f {0} {1}".format(fw_filename, sz_filename))


# env.Execute("pio test -e native")
env.AddPostAction("buildprog", after_build)
