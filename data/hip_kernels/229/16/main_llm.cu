#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Find3DMinMax_llm.cu"
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
    int *d_Result = NULL;
hipMalloc(&d_Result, XSIZE*YSIZE);
float *d_Data1 = NULL;
hipMalloc(&d_Data1, XSIZE*YSIZE);
float *d_Data2 = NULL;
hipMalloc(&d_Data2, XSIZE*YSIZE);
float *d_Data3 = NULL;
hipMalloc(&d_Data3, XSIZE*YSIZE);
int width = XSIZE;
int pitch = 2;
int height = YSIZE;
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
Find3DMinMax<<<gridBlock, threadBlock>>>(d_Result,d_Data1,d_Data2,d_Data3,width,pitch,height);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Find3DMinMax<<<gridBlock, threadBlock>>>(d_Result,d_Data1,d_Data2,d_Data3,width,pitch,height);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Find3DMinMax<<<gridBlock, threadBlock>>>(d_Result,d_Data1,d_Data2,d_Data3,width,pitch,height);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}