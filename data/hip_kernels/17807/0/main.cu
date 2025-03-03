#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <hiprand_kernel.h>
#include <stdlib.h>
#include <hip/hip_runtime.h>
#include <sys/time.h>
#include "BFS_UNIFIED.cu"
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
int source = 1;
int *edges = NULL;
hipMalloc(&edges, XSIZE*YSIZE);
int *dest = NULL;
hipMalloc(&dest, XSIZE*YSIZE);
int *label = NULL;
hipMalloc(&label, XSIZE*YSIZE);
int *visited = NULL;
hipMalloc(&visited, XSIZE*YSIZE);
int *c_frontier_tail = NULL;
hipMalloc(&c_frontier_tail, XSIZE*YSIZE);
int *c_frontier = NULL;
hipMalloc(&c_frontier, XSIZE*YSIZE);
int *p_frontier_tail = NULL;
hipMalloc(&p_frontier_tail, XSIZE*YSIZE);
int *p_frontier = NULL;
hipMalloc(&p_frontier, XSIZE*YSIZE);
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
BFS_UNIFIED<<<gridBlock,threadBlock>>>(source,edges,dest,label,visited,c_frontier_tail,c_frontier,p_frontier_tail,p_frontier);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 10; ++loop_counter) {
BFS_UNIFIED<<<gridBlock,threadBlock>>>(source,edges,dest,label,visited,c_frontier_tail,c_frontier,p_frontier_tail,p_frontier);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 1000; loop_counter++) {
BFS_UNIFIED<<<gridBlock,threadBlock>>>(source,edges,dest,label,visited,c_frontier_tail,c_frontier,p_frontier_tail,p_frontier);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}