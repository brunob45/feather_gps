#! /usr/bin/env python3

import sys
import re

p_register = re.compile(r"r[\d]{1,2}")
p_memory_offset = re.compile(r"\+0x[1-9a-f][0-9a-z]*")
p_label = re.compile(r"<.+>")
p_address = re.compile(r"0x[\da-fA-F]+|\.[\-\+]\d+")

p_label_address = re.compile(r"[\da-fA-F]{8} <(.+)>:$")
p_data_start = re.compile(r"__DATA_REGION_ORIGIN__")


def isLabel(line: str) -> bool:
    m = p_label_address.match(line)
    return m.group(1) if m else None


def replace_data_start(line: str) -> str:
    return p_data_start.sub("__data_start", line)


def do(file_in: str, file_out: str):
    code = {}
    current_label = None

    for line in open(file_in, 'r'):
        label = isLabel(line)
        if label:
            current_label = label
            code[current_label] = ""

        elif current_label and ':' in line:
            line = line.split(';')
            comment = line[1].strip() if len(line) > 1 else None
            line = line[0]
            if len(line) < 64:
                line = p_register.sub("R", line[23:]).strip()
                if comment:
                    address = p_label.search(comment)
                    if address:
                        if any(s in comment for s in ["current_status", "tuning_settings"]):
                            line = replace_data_start(
                                p_address.sub(address.group(), line))
                        else:
                            address = p_memory_offset.sub(
                                "+X", address.group())
                            line = replace_data_start(
                                p_address.sub(address, line))
                    else:
                        line += '\t;\t' + comment
                code[current_label] += '\t' + line + '\n'
            else:
                code[current_label] += line[10:].strip() + '\n'

    labels = list(code.keys())
    labels = sorted(labels, key=str.casefold)

    f = open(file_out, 'w')

    for label in labels:
        f.write(label+':\n')
        f.write(code[label]+'\n')


if __name__ == '__main__':
    do("firmware.S", "asm_post.S")
