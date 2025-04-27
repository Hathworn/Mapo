#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "scatter.cu"
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
    unsigned int *in = NULL;
hipMalloc(&in, XSIZE*YSIZE);
unsigned int *in_pos = NULL;
hipMalloc(&in_pos, XSIZE*YSIZE);
unsigned int *out = NULL;
hipMalloc(&out, XSIZE*YSIZE);
unsigned int *out_pos = NULL;
hipMalloc(&out_pos, XSIZE*YSIZE);
unsigned int n = 1;
unsigned int *d_histScan = NULL;
hipMalloc(&d_histScan, XSIZE*YSIZE);
unsigned int mask = 1;
unsigned int current_bits = 1;
unsigned int nBins = 1;
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
scatter<<<gridBlock, threadBlock>>>(in,in_pos,out,out_pos,n,d_histScan,mask,current_bits,nBins);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
scatter<<<gridBlock, threadBlock>>>(in,in_pos,out,out_pos,n,d_histScan,mask,current_bits,nBins);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
scatter<<<gridBlock, threadBlock>>>(in,in_pos,out,out_pos,n,d_histScan,mask,current_bits,nBins);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}