#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "solvePDEKernel.cu"
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
    float *hPop = NULL;
hipMalloc(&hPop, XSIZE*YSIZE);
float *T_Last = NULL;
hipMalloc(&T_Last, XSIZE*YSIZE);
float *T_New = NULL;
hipMalloc(&T_New, XSIZE*YSIZE);
float *T_Surface = NULL;
hipMalloc(&T_Surface, XSIZE*YSIZE);
float Tw = 1;
float lamda = 1;
float pho = 1;
float ce = 1;
int ny = 1;
float dy = 1;
int nx = 1;
float dx = 1;
float tau = 1;
int tnpts = 1;
int tstep = 1;
float Vcast = 1;
int Section = 1;
float *ccml = NULL;
hipMalloc(&ccml, XSIZE*YSIZE);
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
solvePDEKernel<<<gridBlock, threadBlock>>>(hPop,T_Last,T_New,T_Surface,Tw,lamda,pho,ce,ny,dy,nx,dx,tau,tnpts,tstep,Vcast,Section,ccml);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
solvePDEKernel<<<gridBlock, threadBlock>>>(hPop,T_Last,T_New,T_Surface,Tw,lamda,pho,ce,ny,dy,nx,dx,tau,tnpts,tstep,Vcast,Section,ccml);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
solvePDEKernel<<<gridBlock, threadBlock>>>(hPop,T_Last,T_New,T_Surface,Tw,lamda,pho,ce,ny,dy,nx,dx,tau,tnpts,tstep,Vcast,Section,ccml);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}