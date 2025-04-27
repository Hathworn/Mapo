#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Reconstruct.cu"
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
    int *nex = NULL;
hipMalloc(&nex, XSIZE*YSIZE);
unsigned long nextsize = 1;
double4 *pc = NULL;
hipMalloc(&pc, XSIZE*YSIZE);
double4 *vc = NULL;
hipMalloc(&vc, XSIZE*YSIZE);
double4 *a3 = NULL;
hipMalloc(&a3, XSIZE*YSIZE);
double4 *a = NULL;
hipMalloc(&a, XSIZE*YSIZE);
double4 *a1 = NULL;
hipMalloc(&a1, XSIZE*YSIZE);
double4 *a2 = NULL;
hipMalloc(&a2, XSIZE*YSIZE);
double4 *pva3 = NULL;
hipMalloc(&pva3, XSIZE*YSIZE);
double4 *aaa = NULL;
hipMalloc(&aaa, XSIZE*YSIZE);
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
Reconstruct<<<gridBlock, threadBlock>>>(nex,nextsize,pc,vc,a3,a,a1,a2,pva3,aaa);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Reconstruct<<<gridBlock, threadBlock>>>(nex,nextsize,pc,vc,a3,a,a1,a2,pva3,aaa);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Reconstruct<<<gridBlock, threadBlock>>>(nex,nextsize,pc,vc,a3,a,a1,a2,pva3,aaa);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}