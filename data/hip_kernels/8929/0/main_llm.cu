#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "initTempNodeArray_llm.cu"
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
    const int hitNum = 1;
const int allowableGap = 1;
int *tempNodeArray_score = NULL;
hipMalloc(&tempNodeArray_score, XSIZE*YSIZE);
int *tempNodeArray_vertical = NULL;
hipMalloc(&tempNodeArray_vertical, XSIZE*YSIZE);
int *tempNodeArray_horizontal = NULL;
hipMalloc(&tempNodeArray_horizontal, XSIZE*YSIZE);
int *tempNodeArray_matchNum = NULL;
hipMalloc(&tempNodeArray_matchNum, XSIZE*YSIZE);
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
initTempNodeArray<<<gridBlock, threadBlock>>>(hitNum,allowableGap,tempNodeArray_score,tempNodeArray_vertical,tempNodeArray_horizontal,tempNodeArray_matchNum);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
initTempNodeArray<<<gridBlock, threadBlock>>>(hitNum,allowableGap,tempNodeArray_score,tempNodeArray_vertical,tempNodeArray_horizontal,tempNodeArray_matchNum);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
initTempNodeArray<<<gridBlock, threadBlock>>>(hitNum,allowableGap,tempNodeArray_score,tempNodeArray_vertical,tempNodeArray_horizontal,tempNodeArray_matchNum);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}