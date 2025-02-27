#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "log_motion_estimation_cuda.cu"
#include <chrono>
#include <iostream>
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
uint8 *current = NULL;
hipMalloc(&current, XSIZE*YSIZE);
uint8 *previous = NULL;
hipMalloc(&previous, XSIZE*YSIZE);
int *vectors_x = NULL;
hipMalloc(&vectors_x, XSIZE*YSIZE);
int *vectors_y = NULL;
hipMalloc(&vectors_y, XSIZE*YSIZE);
int *M_B = NULL;
hipMalloc(&M_B, XSIZE*YSIZE);
int *N_B = NULL;
hipMalloc(&N_B, XSIZE*YSIZE);
int *B = NULL;
hipMalloc(&B, XSIZE*YSIZE);
int *M = NULL;
hipMalloc(&M, XSIZE*YSIZE);
int *N = NULL;
hipMalloc(&N, XSIZE*YSIZE);
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
log_motion_estimation_cuda<<<gridBlock,threadBlock>>>(current,previous,vectors_x,vectors_y,M_B,N_B,B,M,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
log_motion_estimation_cuda<<<gridBlock,threadBlock>>>(current,previous,vectors_x,vectors_y,M_B,N_B,B,M,N);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
log_motion_estimation_cuda<<<gridBlock,threadBlock>>>(current,previous,vectors_x,vectors_y,M_B,N_B,B,M,N);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}