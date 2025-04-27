#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "FilmGradeKernelC_llm.cu"
#include <chrono>
#include <iostream>
using namespace std;
using namespace std::chrono;
int main(int argc, char **argv) {
hipSetDevice(0);

    int XSIZE = 512; 
    int YSIZE = 512;
    int BLOCKX = 16;
    int BLOCKY = 16;

    if (argc > 1) XSIZE = atoi(argv[1]);
    if (argc > 2) YSIZE = atoi(argv[2]);
    if (argc > 3) BLOCKX = atoi(argv[3]);
    if (argc > 4) BLOCKY = atoi(argv[4]);
    float *p_Input = NULL;
hipMalloc(&p_Input, XSIZE*YSIZE);
int p_Width = XSIZE;
int p_Height = YSIZE;
float p_ContR = 1;
float p_ContG = 1;
float p_ContB = 1;
float p_SatR = 1;
float p_SatG = 1;
float p_SatB = 1;
float p_ContP = 1;
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
FilmGradeKernelC<<<gridBlock, threadBlock>>>(p_Input,p_Width,p_Height,p_ContR,p_ContG,p_ContB,p_SatR,p_SatG,p_SatB,p_ContP);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
FilmGradeKernelC<<<gridBlock, threadBlock>>>(p_Input,p_Width,p_Height,p_ContR,p_ContG,p_ContB,p_SatR,p_SatG,p_SatB,p_ContP);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
FilmGradeKernelC<<<gridBlock, threadBlock>>>(p_Input,p_Width,p_Height,p_ContR,p_ContG,p_ContB,p_SatR,p_SatG,p_SatB,p_ContP);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}