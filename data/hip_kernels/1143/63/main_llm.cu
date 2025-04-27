#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "aux_fields_llm.cu"
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
    double *V = NULL;
hipMalloc(&V, XSIZE*YSIZE);
double *K = NULL;
hipMalloc(&K, XSIZE*YSIZE);
double gdt = 1;
double dt = 1;
double *Ax = NULL;
hipMalloc(&Ax, XSIZE*YSIZE);
double *Ay = NULL;
hipMalloc(&Ay, XSIZE*YSIZE);
double *Az = NULL;
hipMalloc(&Az, XSIZE*YSIZE);
double *px = NULL;
hipMalloc(&px, XSIZE*YSIZE);
double *py = NULL;
hipMalloc(&py, XSIZE*YSIZE);
double *pz = NULL;
hipMalloc(&pz, XSIZE*YSIZE);
double *pAx = NULL;
hipMalloc(&pAx, XSIZE*YSIZE);
double *pAy = NULL;
hipMalloc(&pAy, XSIZE*YSIZE);
double *pAz = NULL;
hipMalloc(&pAz, XSIZE*YSIZE);
double2 *GV = NULL;
hipMalloc(&GV, XSIZE*YSIZE);
double2 *EV = NULL;
hipMalloc(&EV, XSIZE*YSIZE);
double2 *GK = NULL;
hipMalloc(&GK, XSIZE*YSIZE);
double2 *EK = NULL;
hipMalloc(&EK, XSIZE*YSIZE);
double2 *GpAx = NULL;
hipMalloc(&GpAx, XSIZE*YSIZE);
double2 *GpAy = NULL;
hipMalloc(&GpAy, XSIZE*YSIZE);
double2 *GpAz = NULL;
hipMalloc(&GpAz, XSIZE*YSIZE);
double2 *EpAx = NULL;
hipMalloc(&EpAx, XSIZE*YSIZE);
double2 *EpAy = NULL;
hipMalloc(&EpAy, XSIZE*YSIZE);
double2 *EpAz = NULL;
hipMalloc(&EpAz, XSIZE*YSIZE);
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
aux_fields<<<gridBlock, threadBlock>>>(V,K,gdt,dt,Ax,Ay,Az,px,py,pz,pAx,pAy,pAz,GV,EV,GK,EK,GpAx,GpAy,GpAz,EpAx,EpAy,EpAz);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
aux_fields<<<gridBlock, threadBlock>>>(V,K,gdt,dt,Ax,Ay,Az,px,py,pz,pAx,pAy,pAz,GV,EV,GK,EK,GpAx,GpAy,GpAz,EpAx,EpAy,EpAz);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
aux_fields<<<gridBlock, threadBlock>>>(V,K,gdt,dt,Ax,Ay,Az,px,py,pz,pAx,pAy,pAz,GV,EV,GK,EK,GpAx,GpAy,GpAz,EpAx,EpAy,EpAz);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}