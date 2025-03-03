#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <hiprand_kernel.h>
#include <stdlib.h>
#include <hip/hip_runtime.h>
#include <sys/time.h>
#include "findMatch_GPU.cu"
#include<chrono>
#include<iostream>
using namespace std;
using namespace std::chrono;
int blocks_[20][2] = {{8,8},{16,16},{24,24},{32,32},{1,64},{1,128},{1,192},{1,256},{1,320},{1,384},{1,448},{1,512},{1,576},{1,640},{1,704},{1,768},{1,832},{1,896},{1,960},{1,1024}};
int matrices_[7][2] = {{240,240},{496,496},{784,784},{1016,1016},{1232,1232},{1680,1680},{2024,2024}};
int main(int argc, char **argv) {
hipSetDevice(0);
char* p;int matrix_len=strtol(argv[1], &p, 10);
for(int matrix_looper=0;matrix_looper<matrix_len;matrix_looper++){
for(int block_looper=0;block_looper<20;block_looper++){
int XSIZE=matrices_[matrix_looper][0],YSIZE=matrices_[matrix_looper][1],BLOCKX=blocks_[block_looper][0],BLOCKY=blocks_[block_looper][1];
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
while(iXSIZE%BLOCKX!=0)
{
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0)
{
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
findMatch_GPU<<<gridBlock,threadBlock>>>(u_vals,v_vals,size_total,planes_a,planes_b,planes_c,disparity_grid,grid_dims,I1_desc,I2_desc,P,plane_radius,width,height,valids,right_image,D);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 10; ++loop_counter) {
findMatch_GPU<<<gridBlock,threadBlock>>>(u_vals,v_vals,size_total,planes_a,planes_b,planes_c,disparity_grid,grid_dims,I1_desc,I2_desc,P,plane_radius,width,height,valids,right_image,D);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 1000; loop_counter++) {
findMatch_GPU<<<gridBlock,threadBlock>>>(u_vals,v_vals,size_total,planes_a,planes_b,planes_c,disparity_grid,grid_dims,I1_desc,I2_desc,P,plane_radius,width,height,valids,right_image,D);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}