#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "VanLeerThetaKernel_llm.cu"
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
double *Surf = NULL;
hipMalloc(&Surf, XSIZE*YSIZE);
double dt = 1;
int nrad = 1;
int nsec = 1;
int UniformTransport = XSIZE*YSIZE;
int *NoSplitAdvection = NULL;
hipMalloc(&NoSplitAdvection, XSIZE*YSIZE);
double *QRStar = NULL;
hipMalloc(&QRStar, XSIZE*YSIZE);
double *DensStar = NULL;
hipMalloc(&DensStar, XSIZE*YSIZE);
double *Vazimutal_d = NULL;
hipMalloc(&Vazimutal_d, XSIZE*YSIZE);
double *Qbase = NULL;
hipMalloc(&Qbase, XSIZE*YSIZE);
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
VanLeerThetaKernel<<<gridBlock, threadBlock>>>(Rsup,Rinf,Surf,dt,nrad,nsec,UniformTransport,NoSplitAdvection,QRStar,DensStar,Vazimutal_d,Qbase);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
VanLeerThetaKernel<<<gridBlock, threadBlock>>>(Rsup,Rinf,Surf,dt,nrad,nsec,UniformTransport,NoSplitAdvection,QRStar,DensStar,Vazimutal_d,Qbase);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
VanLeerThetaKernel<<<gridBlock, threadBlock>>>(Rsup,Rinf,Surf,dt,nrad,nsec,UniformTransport,NoSplitAdvection,QRStar,DensStar,Vazimutal_d,Qbase);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}