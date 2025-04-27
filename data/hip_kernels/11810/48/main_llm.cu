#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "ConditionCFLKernel1D_llm.cu"
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
    double *Rsup = NULL;
hipMalloc(&Rsup, XSIZE*YSIZE);
double *Rinf = NULL;
hipMalloc(&Rinf, XSIZE*YSIZE);
double *Rmed = NULL;
hipMalloc(&Rmed, XSIZE*YSIZE);
int nrad = 1;
int nsec = 1;
double *Vtheta = NULL;
hipMalloc(&Vtheta, XSIZE*YSIZE);
double *Vmoy = NULL;
hipMalloc(&Vmoy, XSIZE*YSIZE);
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
ConditionCFLKernel1D<<<gridBlock, threadBlock>>>(Rsup,Rinf,Rmed,nrad,nsec,Vtheta,Vmoy);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
ConditionCFLKernel1D<<<gridBlock, threadBlock>>>(Rsup,Rinf,Rmed,nrad,nsec,Vtheta,Vmoy);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
ConditionCFLKernel1D<<<gridBlock, threadBlock>>>(Rsup,Rinf,Rmed,nrad,nsec,Vtheta,Vmoy);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}