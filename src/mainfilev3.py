class main_skeleton():
    def __init__(self):
        super().__init__()
        self.includes = ["#include <stdbool.h>",
                         "#include <stdio.h>",
                         "#include <string.h>",
                         "#include <getopt.h>",
                         "#include <stdlib.h>",
                         "#include <sys/time.h>",
                         "#include <hip/hip_runtime.h>"]

        self.statics = ["#include <chrono>",
                        "#include <iostream>",
                        "using namespace std;",
                        "using namespace std::chrono;"]
        
        self.main = [
            "int main(int argc, char **argv) {",
            "hipSetDevice(0);",
        ]
        
        self.variables = []
        self.thread_dims = [
            "int iXSIZE=XSIZE;",
            "int iYSIZE=YSIZE;",
            "while(iXSIZE%BLOCKX!=0) {",
            "   iXSIZE++;",
            "}",
            "while(iYSIZE%BLOCKY!=0) {",
            "   iYSIZE++;",
            "}",
            "dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);",
            "dim3 threadBlock(BLOCKX, BLOCKY);"
        ]
        
        self.function_call = []
        
        self.end = [
            "}",
            "hipDeviceSynchronize();",
            "auto end = steady_clock::now();",
            "auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);",
            "cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;"
        ]
        
        self.variable_names = []

    def change_function(self, function_name: str):
        self.function_call.append("hipFree(0);")
        variables = ",".join(self.variable_names)
        self.function_call.append(f"{function_name}<<<gridBlock, threadBlock>>>({variables});")
        self.function_call.append("hipDeviceSynchronize();")
        self.function_call.append("for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {")
        self.function_call.append(f"{function_name}<<<gridBlock, threadBlock>>>({variables});")
        self.function_call.append("}")
        self.function_call.append("hipDeviceSynchronize();")
        self.function_call.append("auto start = steady_clock::now();")
        self.function_call.append("for (int loop_counter = 0; loop_counter < 5; loop_counter++) {")
        self.function_call.append(f"{function_name}<<<gridBlock, threadBlock>>>({variables});")

    def add_variables(self, function_name: str, variables: list):
        for var in variables:
            v = var[0]
            if '*' in v:
                self.variables.append(f"{v}{var[1]} = NULL;")
                self.variable_names.append(var[1])
                self.variables.append(f"hipMalloc(&{var[1]}, XSIZE*YSIZE);")
            else:
                self.variable_names.append(var[1])
                self.variables.append(f"{v} {var[1]} = XSIZE*YSIZE;")

    def add_includes(self, includes: list):
        self.includes += includes

    def save_main(self, loc: str):
        total = self.includes + self.statics + self.main + self.variables + self.thread_dims + self.function_call + self.end + ["}"]
        with open(f"{loc}/main.cu", 'w') as f:
        # with open(f"{loc}/main_llm.cu", 'w') as f:
            f.write('\n'.join(total))
            
