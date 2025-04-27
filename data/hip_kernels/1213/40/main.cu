#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "decat.cu"
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
    float *output1 = NULL;
hipMalloc(&output1, XSIZE*YSIZE);
float *output2 = NULL;
hipMalloc(&output2, XSIZE*YSIZE);
float *output3 = NULL;
hipMalloc(&output3, XSIZE*YSIZE);
float *output4 = NULL;
hipMalloc(&output4, XSIZE*YSIZE);
size_t num1 = 1;
size_t num2 = 1;
size_t num3 = 1;
size_t num4 = 1;
size_t maxNum = 1;
float *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
const int numPerBatch = 1;
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
decat<<<gridBlock, threadBlock>>>(output1,output2,output3,output4,num1,num2,num3,num4,maxNum,input,numPerBatch);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
decat<<<gridBlock, threadBlock>>>(output1,output2,output3,output4,num1,num2,num3,num4,maxNum,input,numPerBatch);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
decat<<<gridBlock, threadBlock>>>(output1,output2,output3,output4,num1,num2,num3,num4,maxNum,input,numPerBatch);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}