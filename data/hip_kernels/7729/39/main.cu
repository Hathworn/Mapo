#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gHighwayBackward.cu"
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
    float *out1 = NULL;
hipMalloc(&out1, XSIZE*YSIZE);
float *out2 = NULL;
hipMalloc(&out2, XSIZE*YSIZE);
float *outt = NULL;
hipMalloc(&outt, XSIZE*YSIZE);
const float *in1 = NULL;
hipMalloc(&in1, XSIZE*YSIZE);
const float *in2 = NULL;
hipMalloc(&in2, XSIZE*YSIZE);
const float *t = NULL;
hipMalloc(&t, XSIZE*YSIZE);
const float *adj = NULL;
hipMalloc(&adj, XSIZE*YSIZE);
size_t length = 1;
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
gHighwayBackward<<<gridBlock, threadBlock>>>(out1,out2,outt,in1,in2,t,adj,length);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gHighwayBackward<<<gridBlock, threadBlock>>>(out1,out2,outt,in1,in2,t,adj,length);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gHighwayBackward<<<gridBlock, threadBlock>>>(out1,out2,outt,in1,in2,t,adj,length);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}