#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "GetOutlet_llm.cu"
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
    double *h = NULL;
hipMalloc(&h, XSIZE*YSIZE);
double *houtlet = NULL;
hipMalloc(&houtlet, XSIZE*YSIZE);
double *u = NULL;
hipMalloc(&u, XSIZE*YSIZE);
double *uout = NULL;
hipMalloc(&uout, XSIZE*YSIZE);
double *v = NULL;
hipMalloc(&v, XSIZE*YSIZE);
double *vout = NULL;
hipMalloc(&vout, XSIZE*YSIZE);
int M = 2;
int N = XSIZE*YSIZE;
int t = 1;
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
GetOutlet<<<gridBlock, threadBlock>>>(h,houtlet,u,uout,v,vout,M,N,t);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
GetOutlet<<<gridBlock, threadBlock>>>(h,houtlet,u,uout,v,vout,M,N,t);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
GetOutlet<<<gridBlock, threadBlock>>>(h,houtlet,u,uout,v,vout,M,N,t);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}