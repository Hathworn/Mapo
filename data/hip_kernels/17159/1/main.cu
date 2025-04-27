#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "simOBEcudaCoPolTest.cu"
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
    double *AC = NULL;
hipMalloc(&AC, XSIZE*YSIZE);
const double *Delaylist = NULL;
hipMalloc(&Delaylist, XSIZE*YSIZE);
const double w = 1;
const double FWHM = 1;
const double G1 = 1;
const double G2 = 1;
const double G3 = 1;
const double t_min = 1;
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
simOBEcudaCoPolTest<<<gridBlock, threadBlock>>>(AC,Delaylist,w,FWHM,G1,G2,G3,t_min);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
simOBEcudaCoPolTest<<<gridBlock, threadBlock>>>(AC,Delaylist,w,FWHM,G1,G2,G3,t_min);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
simOBEcudaCoPolTest<<<gridBlock, threadBlock>>>(AC,Delaylist,w,FWHM,G1,G2,G3,t_min);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}