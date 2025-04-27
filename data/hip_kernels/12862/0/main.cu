#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "generateData.cu"
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
    int dimension = 1;
int rseed = 1;
double *rotation = NULL;
hipMalloc(&rotation, XSIZE*YSIZE);
int number_of_peaks = 1;
double *peak_values = NULL;
hipMalloc(&peak_values, XSIZE*YSIZE);
double *x_local = NULL;
hipMalloc(&x_local, XSIZE*YSIZE);
double *arr_scales = NULL;
hipMalloc(&arr_scales, XSIZE*YSIZE);
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
generateData<<<gridBlock, threadBlock>>>(dimension,rseed,rotation,number_of_peaks,peak_values,x_local,arr_scales);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
generateData<<<gridBlock, threadBlock>>>(dimension,rseed,rotation,number_of_peaks,peak_values,x_local,arr_scales);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
generateData<<<gridBlock, threadBlock>>>(dimension,rseed,rotation,number_of_peaks,peak_values,x_local,arr_scales);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}