#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "sum_optimization_llm.cu"
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
    float *in = NULL;
hipMalloc(&in, XSIZE*YSIZE);
int inStr0 = 1;
int inStr1 = 1;
int inStr2 = 1;
int inStr3 = 1;
float *out = NULL;
hipMalloc(&out, XSIZE*YSIZE);
int outStr0 = 1;
int outStr1 = 1;
int outStr2 = 1;
int dim = 2;
int nElementOut = 1;
int dimSize = XSIZE*YSIZE;
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
sum_optimization<<<gridBlock, threadBlock>>>(in,inStr0,inStr1,inStr2,inStr3,out,outStr0,outStr1,outStr2,dim,nElementOut,dimSize);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
sum_optimization<<<gridBlock, threadBlock>>>(in,inStr0,inStr1,inStr2,inStr3,out,outStr0,outStr1,outStr2,dim,nElementOut,dimSize);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
sum_optimization<<<gridBlock, threadBlock>>>(in,inStr0,inStr1,inStr2,inStr3,out,outStr0,outStr1,outStr2,dim,nElementOut,dimSize);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}