# 2025.3.10 author:cjk 使用mainfilev3.py函数为每个核函数创建main.cu文件，用于执行核函数。
# 2025.4.11 author:cjk 生成优化后代码对应的main.cu
import pandas as pd
from mainfilev3 import main_skeleton
import re
from pathlib import Path
import glob
import os
import subprocess
import numpy as np
import time
from os import path
import ast
import sys
import datetime

# 使用mainfilev3.py文件中的函数，生成main.cu文件，在这个文件还加上一个操作：include对应核函数
def remake_main(path:str,variables:str,function_name:str):
    variables =ast.literal_eval(variables)
    main_body = main_skeleton()
    main_body.add_variables(function_name,variables)
    main_body.change_function(function_name)
    main_body.add_includes(['#include "'+function_name+'_llm.cu"'])
    main_body.save_main(path)

# 我在生成main.cu文件，修改完其中变量后，再添加初始化变量。不然下面这些变量会在第二步被莫名其妙修改。
def add_default_values_to_mainfile(mainfile: str):
    # 要插入的代码行
    default_values_code = """
    int XSIZE = 512; 
    int YSIZE = 512;
    int BLOCKX = 16;
    int BLOCKY = 16;

    if (argc > 1) XSIZE = atoi(argv[1]);
    if (argc > 2) YSIZE = atoi(argv[2]);
    if (argc > 3) BLOCKX = atoi(argv[3]);
    if (argc > 4) BLOCKY = atoi(argv[4]);
    """

    # 打开文件并读取内容
    with open(mainfile, 'r') as f:
        lines = f.readlines()

    # 查找hipSetDevice(0);并在其后插入代码
    for i, line in enumerate(lines):
        if "hipSetDevice(0);" in line:
            # print("find")
            lines.insert(i + 1, default_values_code)  # 插入代码行
            break

    # 将修改后的内容写回文件
    with open(mainfile, 'w') as f:
        f.writelines(lines)

def find_value_for_list(in_var:str,checklist,exact):
    if exact:
        if in_var.lower() in checklist:
            return True
        else:
            return False

    else:
        for l in checklist:
            if in_var.lower().find(l)!=-1:
                return True

        return False

# 查找一些变量并替换为自己定义的数值
def find_value(in_var:str):
    in_var=in_var.split()[1]
    sizes_c=["size"]
    sizes_e=["n"]
    width_c=["width"]
    width_e=["w","rows","n_a","ixsize"]
    height_c=["height","iysize"]
    height_e=["h","cols","n_b"]
    irrelevant_c=["pitch","batch","stride","spatial","filter","scale","alpha","beta"]
    irrelevant_e=["a","b","c","d3","d2","d1","m","dim","seed","value","offset","pad"]


    if find_value_for_list(in_var,width_c,False):
        return "XSIZE"
    elif find_value_for_list(in_var,width_e,True):
        return "XSIZE"
    elif find_value_for_list(in_var,height_c,False):
        return "YSIZE"
    elif find_value_for_list(in_var,height_e,True):
        return "YSIZE"
    elif find_value_for_list(in_var,sizes_e,True):
        return "XSIZE*YSIZE"
    elif find_value_for_list(in_var,sizes_c,False):
        return "XSIZE*YSIZE"
    elif find_value_for_list(in_var,irrelevant_c,False):
        return "2"
    elif find_value_for_list(in_var,irrelevant_e,True):
        return "2"

    return "1"

# 修改一些变量的值和GPU设备
def edit_values(path:str,device_id):
    a_file=None
    out = []
    try:
        a_file = open(path, "r")
        for line in a_file:
            stripped_line = line.strip()
            out.append(stripped_line)
        a_file.close()
    except UnicodeDecodeError:
        out=[]
        a_file = open(path, "r",encoding="latin1")
        for line in a_file:
            stripped_line = line.strip()
            out.append(stripped_line)
        a_file.close()
    for c in range(len(out)):
        if out[c].find("=")!=-1 and  out[c].find("for")==-1 and  out[c].find("while")==-1 and  out[c].find("auto")==-1 and out[c].find("blocks_")==-1 and out[c].find("matrices_")==-1:
            if out[c].split("=")[0].find("*")==-1:
                left=out[c].split("=")[0]
                out[c]=left+"= "+find_value(left)+";"
            # if out[c]=="cudaSetDevice(0);":
            #     out[c]="cudaSetDevice("+str(device_id)+");"
            if out[c]=="hipSetDevice(0);":
                out[c]="hipSetDevice("+str(device_id)+");"
    fs=open(path,'w')
    s1='\n'.join(out)
    fs.write(s1)
    fs.close()


def add_variables(df,variables,function):
    variables =ast.literal_eval(variables)
    for v in variables:
        if v[0].find("*")==-1:
            assumed_type = None
            for e in excacts:
                if v[1].lower().find(e)!=-1:
                    assumed_type=e
                    break
            for a in avoids:
                if v[1].lower().find(a)!=-1:
                    assumed_type=a
                    break
            df=df.append({'function':function , 'type' : v[0],"name":v[1],"assumed_type":assumed_type} , ignore_index=True)
    return df


def main():
    data_path = "/home/LiuS/LS-CAT-HIP/data/"
    # results_path = "./results/"

    # 读取 kernel_list.csv 文件
    runs = pd.read_csv(data_path + 'kernel_list.csv')
    print("总核函数数量:", len(runs))

    counter = 0
    total_compute_time = time.time()
    prev_output_str_len = 0

    print("开始生成 main.cu 文件 ...\n")

    for index, row in runs.iterrows():
        # 构建 kernel_path
        kernel_path = path.join(data_path, "hip_kernels", str(row["Repo"]), str(row["underdirectory"]))
        
        # 这里设置生成main文件名字
        mainfile = path.join(kernel_path, "main.cu")
        # mainfile = path.join(kernel_path, "main_llm.cu")


        # 判断 kernel_path 是否存在
        if not path.exists(kernel_path):
            print(f"路径不存在，跳过：{kernel_path}")
            continue

        # 判断 main.cu 是否已经存在（避免重复生成）
        # if not path.exists(mainfile):
        if True:
            print(f"生成：{mainfile}")
            remake_main(kernel_path, row['variables'], row['function'])
            edit_values(mainfile,0)
            add_default_values_to_mainfile(mainfile)

        counter += 1
        # 估算剩余时间
        elapsed_time = time.time() - total_compute_time
        time_left = (elapsed_time / counter) * (len(runs) - counter)

        # 进度条输出
        print(" " * prev_output_str_len, end="\r")
        output_str = (
            f"生成进度: {counter}/{len(runs)} "
            f"({round(100 * counter / len(runs), 2)}%), "
            f"剩余时间: {str(datetime.timedelta(seconds=int(time_left)))}"
        )
        prev_output_str_len = len(output_str)
        print(output_str, end="\r")

    print("\n\n全部 main.cu 文件生成完成！")


if __name__ == "__main__":
    main()

