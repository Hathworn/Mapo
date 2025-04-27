#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "findMatch_GPU_llm.cu"
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
    int32_t *u_vals = NULL;
hipMalloc(&u_vals, XSIZE*YSIZE);
int32_t *v_vals = NULL;
hipMalloc(&v_vals, XSIZE*YSIZE);
int32_t size_total = XSIZE*YSIZE;
float *planes_a = NULL;
hipMalloc(&planes_a, XSIZE*YSIZE);
float *planes_b = NULL;
hipMalloc(&planes_b, XSIZE*YSIZE);
float *planes_c = NULL;
hipMalloc(&planes_c, XSIZE*YSIZE);
int32_t *disparity_grid = NULL;
hipMalloc(&disparity_grid, XSIZE*YSIZE);
int32_t *grid_dims = NULL;
hipMalloc(&grid_dims, XSIZE*YSIZE);
uint8_t *I1_desc = NULL;
hipMalloc(&I1_desc, XSIZE*YSIZE);
uint8_t *I2_desc = NULL;
hipMalloc(&I2_desc, XSIZE*YSIZE);
int32_t *P = NULL;
hipMalloc(&P, XSIZE*YSIZE);
int32_t plane_radius = 1;
int32_t width = XSIZE;
int32_t height = YSIZE;
bool *valids = NULL;
hipMalloc(&valids, XSIZE*YSIZE);
bool right_image = 1;
float *D = NULL;
hipMalloc(&D, XSIZE*YSIZE);
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
findMatch_GPU<<<gridBlock, threadBlock>>>(u_vals,v_vals,size_total,planes_a,planes_b,planes_c,disparity_grid,grid_dims,I1_desc,I2_desc,P,plane_radius,width,height,valids,right_image,D);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
findMatch_GPU<<<gridBlock, threadBlock>>>(u_vals,v_vals,size_total,planes_a,planes_b,planes_c,disparity_grid,grid_dims,I1_desc,I2_desc,P,plane_radius,width,height,valids,right_image,D);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
findMatch_GPU<<<gridBlock, threadBlock>>>(u_vals,v_vals,size_total,planes_a,planes_b,planes_c,disparity_grid,grid_dims,I1_desc,I2_desc,P,plane_radius,width,height,valids,right_image,D);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}