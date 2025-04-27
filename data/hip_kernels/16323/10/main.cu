#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_update.cu"
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
    float4 *d_positions = NULL;
hipMalloc(&d_positions, XSIZE*YSIZE);
float4 *d_og_positions = NULL;
hipMalloc(&d_og_positions, XSIZE*YSIZE);
float4 *d_velocities = NULL;
hipMalloc(&d_velocities, XSIZE*YSIZE);
float *d_masses = NULL;
hipMalloc(&d_masses, XSIZE*YSIZE);
size_t numel = 1;
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
kernel_update<<<gridBlock, threadBlock>>>(d_positions,d_og_positions,d_velocities,d_masses,numel);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_update<<<gridBlock, threadBlock>>>(d_positions,d_og_positions,d_velocities,d_masses,numel);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_update<<<gridBlock, threadBlock>>>(d_positions,d_og_positions,d_velocities,d_masses,numel);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}