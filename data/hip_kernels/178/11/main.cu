#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "_kernelpp_cuda.cu"
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
    int num_projections = 1;
float mov = 1;
int num_pixels = 1;
int num_grid = 1;
int num_slices = 1;
float *dev_gridx = NULL;
hipMalloc(&dev_gridx, XSIZE*YSIZE);
float *dev_gridy = NULL;
hipMalloc(&dev_gridy, XSIZE*YSIZE);
float *dev_suma = NULL;
hipMalloc(&dev_suma, XSIZE*YSIZE);
float *dev_E = NULL;
hipMalloc(&dev_E, XSIZE*YSIZE);
float *dev_data = NULL;
hipMalloc(&dev_data, XSIZE*YSIZE);
float *dev_recon = NULL;
hipMalloc(&dev_recon, XSIZE*YSIZE);
float *dev_theta = NULL;
hipMalloc(&dev_theta, XSIZE*YSIZE);
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
_kernelpp_cuda<<<gridBlock, threadBlock>>>(num_projections,mov,num_pixels,num_grid,num_slices,dev_gridx,dev_gridy,dev_suma,dev_E,dev_data,dev_recon,dev_theta);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
_kernelpp_cuda<<<gridBlock, threadBlock>>>(num_projections,mov,num_pixels,num_grid,num_slices,dev_gridx,dev_gridy,dev_suma,dev_E,dev_data,dev_recon,dev_theta);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
_kernelpp_cuda<<<gridBlock, threadBlock>>>(num_projections,mov,num_pixels,num_grid,num_slices,dev_gridx,dev_gridy,dev_suma,dev_E,dev_data,dev_recon,dev_theta);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}