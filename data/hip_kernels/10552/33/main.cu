#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "_A_mul_Bs_64.cu"
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
    int mx = 1;
int ns = 1;
double *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
double *sval = NULL;
hipMalloc(&sval, XSIZE*YSIZE);
int *srow = NULL;
hipMalloc(&srow, XSIZE*YSIZE);
int *scol = NULL;
hipMalloc(&scol, XSIZE*YSIZE);
double *k = NULL;
hipMalloc(&k, XSIZE*YSIZE);
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
_A_mul_Bs_64<<<gridBlock, threadBlock>>>(mx,ns,x,sval,srow,scol,k);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
_A_mul_Bs_64<<<gridBlock, threadBlock>>>(mx,ns,x,sval,srow,scol,k);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
_A_mul_Bs_64<<<gridBlock, threadBlock>>>(mx,ns,x,sval,srow,scol,k);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}