#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpu_find_vac_llm.cu"
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
const int correlation_step = 1;
const double *g_vx = NULL;
hipMalloc(&g_vx, XSIZE*YSIZE);
const double *g_vy = NULL;
hipMalloc(&g_vy, XSIZE*YSIZE);
const double *g_vz = NULL;
hipMalloc(&g_vz, XSIZE*YSIZE);
const double *g_vx_all = NULL;
hipMalloc(&g_vx_all, XSIZE*YSIZE);
const double *g_vy_all = NULL;
hipMalloc(&g_vy_all, XSIZE*YSIZE);
const double *g_vz_all = NULL;
hipMalloc(&g_vz_all, XSIZE*YSIZE);
double *g_vac_x = NULL;
hipMalloc(&g_vac_x, XSIZE*YSIZE);
double *g_vac_y = NULL;
hipMalloc(&g_vac_y, XSIZE*YSIZE);
double *g_vac_z = NULL;
hipMalloc(&g_vac_z, XSIZE*YSIZE);
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
gpu_find_vac<<<gridBlock, threadBlock>>>(num_atoms,correlation_step,g_vx,g_vy,g_vz,g_vx_all,g_vy_all,g_vz_all,g_vac_x,g_vac_y,g_vac_z);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpu_find_vac<<<gridBlock, threadBlock>>>(num_atoms,correlation_step,g_vx,g_vy,g_vz,g_vx_all,g_vy_all,g_vz_all,g_vac_x,g_vac_y,g_vac_z);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpu_find_vac<<<gridBlock, threadBlock>>>(num_atoms,correlation_step,g_vx,g_vy,g_vz,g_vx_all,g_vy_all,g_vz_all,g_vac_x,g_vac_y,g_vac_z);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}