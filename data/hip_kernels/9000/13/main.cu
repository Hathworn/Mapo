#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "dev_get_potential_energy.cu"
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
    float *partial_results = NULL;
hipMalloc(&partial_results, XSIZE*YSIZE);
float eps2 = 1;
float *field_m = NULL;
hipMalloc(&field_m, XSIZE*YSIZE);
float *fxh = NULL;
hipMalloc(&fxh, XSIZE*YSIZE);
float *fyh = NULL;
hipMalloc(&fyh, XSIZE*YSIZE);
float *fzh = NULL;
hipMalloc(&fzh, XSIZE*YSIZE);
float *fxt = NULL;
hipMalloc(&fxt, XSIZE*YSIZE);
float *fyt = NULL;
hipMalloc(&fyt, XSIZE*YSIZE);
float *fzt = NULL;
hipMalloc(&fzt, XSIZE*YSIZE);
int n_field = 1;
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
dev_get_potential_energy<<<gridBlock, threadBlock>>>(partial_results,eps2,field_m,fxh,fyh,fzh,fxt,fyt,fzt,n_field);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
dev_get_potential_energy<<<gridBlock, threadBlock>>>(partial_results,eps2,field_m,fxh,fyh,fzh,fxt,fyt,fzt,n_field);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
dev_get_potential_energy<<<gridBlock, threadBlock>>>(partial_results,eps2,field_m,fxh,fyh,fzh,fxt,fyt,fzt,n_field);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}