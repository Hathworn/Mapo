#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "atomicScatter.cu"
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
    int type1 = 1;
int type2 = 1;
int size_K = XSIZE*YSIZE;
double *occ = NULL;
hipMalloc(&occ, XSIZE*YSIZE);
double *beq = NULL;
hipMalloc(&beq, XSIZE*YSIZE);
double *K = NULL;
hipMalloc(&K, XSIZE*YSIZE);
double *a = NULL;
hipMalloc(&a, XSIZE*YSIZE);
double *b = NULL;
hipMalloc(&b, XSIZE*YSIZE);
double *c = NULL;
hipMalloc(&c, XSIZE*YSIZE);
double *ffoobb = NULL;
hipMalloc(&ffoobb, XSIZE*YSIZE);
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
atomicScatter<<<gridBlock, threadBlock>>>(type1,type2,size_K,occ,beq,K,a,b,c,ffoobb);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
atomicScatter<<<gridBlock, threadBlock>>>(type1,type2,size_K,occ,beq,K,a,b,c,ffoobb);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
atomicScatter<<<gridBlock, threadBlock>>>(type1,type2,size_K,occ,beq,K,a,b,c,ffoobb);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}