#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "__minImpurityb_llm.cu"
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
    long long *keys = NULL;
hipMalloc(&keys, XSIZE*YSIZE);
int *counts = NULL;
hipMalloc(&counts, XSIZE*YSIZE);
int *outv = NULL;
hipMalloc(&outv, XSIZE*YSIZE);
int *outf = NULL;
hipMalloc(&outf, XSIZE*YSIZE);
float *outg = NULL;
hipMalloc(&outg, XSIZE*YSIZE);
int *outc = NULL;
hipMalloc(&outc, XSIZE*YSIZE);
int *jc = NULL;
hipMalloc(&jc, XSIZE*YSIZE);
int *fieldlens = NULL;
hipMalloc(&fieldlens, XSIZE*YSIZE);
int nnodes = 1;
int ncats = 1;
int nsamps = 1;
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
__minImpurityb<<<gridBlock, threadBlock>>>(keys,counts,outv,outf,outg,outc,jc,fieldlens,nnodes,ncats,nsamps);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
__minImpurityb<<<gridBlock, threadBlock>>>(keys,counts,outv,outf,outg,outc,jc,fieldlens,nnodes,ncats,nsamps);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
__minImpurityb<<<gridBlock, threadBlock>>>(keys,counts,outv,outf,outg,outc,jc,fieldlens,nnodes,ncats,nsamps);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}