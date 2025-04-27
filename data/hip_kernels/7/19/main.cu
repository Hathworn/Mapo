#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "block_QR.cu"
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
    float *z = NULL;
hipMalloc(&z, XSIZE*YSIZE);
float *z1 = NULL;
hipMalloc(&z1, XSIZE*YSIZE);
float *vector = NULL;
hipMalloc(&vector, XSIZE*YSIZE);
float *vector1 = NULL;
hipMalloc(&vector1, XSIZE*YSIZE);
float *Q = NULL;
hipMalloc(&Q, XSIZE*YSIZE);
float *NewQ = NULL;
hipMalloc(&NewQ, XSIZE*YSIZE);
float *R = NULL;
hipMalloc(&R, XSIZE*YSIZE);
float *PrevM = NULL;
hipMalloc(&PrevM, XSIZE*YSIZE);
float *NewM = NULL;
hipMalloc(&NewM, XSIZE*YSIZE);
int *converged = NULL;
hipMalloc(&converged, XSIZE*YSIZE);
float *eigenvector = NULL;
hipMalloc(&eigenvector, XSIZE*YSIZE);
const int *WidthOfMatrix = NULL;
hipMalloc(&WidthOfMatrix, XSIZE*YSIZE);
const int *ind = NULL;
hipMalloc(&ind, XSIZE*YSIZE);
const int *vind = NULL;
hipMalloc(&vind, XSIZE*YSIZE);
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
block_QR<<<gridBlock, threadBlock>>>(z,z1,vector,vector1,Q,NewQ,R,PrevM,NewM,converged,eigenvector,WidthOfMatrix,ind,vind);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
block_QR<<<gridBlock, threadBlock>>>(z,z1,vector,vector1,Q,NewQ,R,PrevM,NewM,converged,eigenvector,WidthOfMatrix,ind,vind);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
block_QR<<<gridBlock, threadBlock>>>(z,z1,vector,vector1,Q,NewQ,R,PrevM,NewM,converged,eigenvector,WidthOfMatrix,ind,vind);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}