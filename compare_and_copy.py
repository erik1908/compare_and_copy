open("out1.txt", "w").writelines([l for l in open("in.txt").readlines() if "tests/file/myword" in l])
with open("in.txt") as f:
    with open("out.txt", "w") as f1:
        for line in f:
            if "ROW" in line:
                f1.write(line)