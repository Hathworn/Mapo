#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "d_sct_axinterp.cu"
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
    float *sct3d = NULL;
hipMalloc(&sct3d, XSIZE*YSIZE);
const float *scts1 = NULL;
hipMalloc(&scts1, XSIZE*YSIZE);
const int4 *sctaxR = NULL;
hipMalloc(&sctaxR, XSIZE*YSIZE);
const float4 *sctaxW = NULL;
hipMalloc(&sctaxW, XSIZE*YSIZE);
const short *sn1_sn11 = NULL;
hipMalloc(&sn1_sn11, XSIZE*YSIZE);
int NBIN = 1;
int NSN1 = 1;
int SPN = 1;
int offtof = 1;
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
d_sct_axinterp<<<gridBlock, threadBlock>>>(sct3d,scts1,sctaxR,sctaxW,sn1_sn11,NBIN,NSN1,SPN,offtof);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
d_sct_axinterp<<<gridBlock, threadBlock>>>(sct3d,scts1,sctaxR,sctaxW,sn1_sn11,NBIN,NSN1,SPN,offtof);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
d_sct_axinterp<<<gridBlock, threadBlock>>>(sct3d,scts1,sctaxR,sctaxW,sn1_sn11,NBIN,NSN1,SPN,offtof);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}