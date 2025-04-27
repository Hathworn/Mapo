#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpu_copy_velocity.cu"
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
    const int num_atoms = 1;
const int offset = 1;
const int *g_group_contents = NULL;
hipMalloc(&g_group_contents, XSIZE*YSIZE);
const double *g_vx_i = NULL;
hipMalloc(&g_vx_i, XSIZE*YSIZE);
const double *g_vy_i = NULL;
hipMalloc(&g_vy_i, XSIZE*YSIZE);
const double *g_vz_i = NULL;
hipMalloc(&g_vz_i, XSIZE*YSIZE);
double *g_vx_o = NULL;
hipMalloc(&g_vx_o, XSIZE*YSIZE);
double *g_vy_o = NULL;
hipMalloc(&g_vy_o, XSIZE*YSIZE);
double *g_vz_o = NULL;
hipMalloc(&g_vz_o, XSIZE*YSIZE);
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
gpu_copy_velocity<<<gridBlock, threadBlock>>>(num_atoms,offset,g_group_contents,g_vx_i,g_vy_i,g_vz_i,g_vx_o,g_vy_o,g_vz_o);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpu_copy_velocity<<<gridBlock, threadBlock>>>(num_atoms,offset,g_group_contents,g_vx_i,g_vy_i,g_vz_i,g_vx_o,g_vy_o,g_vz_o);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpu_copy_velocity<<<gridBlock, threadBlock>>>(num_atoms,offset,g_group_contents,g_vx_i,g_vy_i,g_vz_i,g_vx_o,g_vy_o,g_vz_o);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}