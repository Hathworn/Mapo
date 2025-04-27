#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "concat.cu"
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
    float *output = NULL;
hipMalloc(&output, XSIZE*YSIZE);
float *input1 = NULL;
hipMalloc(&input1, XSIZE*YSIZE);
float *input2 = NULL;
hipMalloc(&input2, XSIZE*YSIZE);
float *input3 = NULL;
hipMalloc(&input3, XSIZE*YSIZE);
float *input4 = NULL;
hipMalloc(&input4, XSIZE*YSIZE);
const int size = 1;
const int in_channel1 = 1;
const int in_channel2 = 1;
const int in_channel3 = 1;
const int in_channel4 = 1;
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
concat<<<gridBlock, threadBlock>>>(output,input1,input2,input3,input4,size,in_channel1,in_channel2,in_channel3,in_channel4);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
concat<<<gridBlock, threadBlock>>>(output,input1,input2,input3,input4,size,in_channel1,in_channel2,in_channel3,in_channel4);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
concat<<<gridBlock, threadBlock>>>(output,input1,input2,input3,input4,size,in_channel1,in_channel2,in_channel3,in_channel4);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}