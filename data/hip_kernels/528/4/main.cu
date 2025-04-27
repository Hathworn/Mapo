#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "k3.cu"
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
    const int N = 1;
int *augPath = NULL;
hipMalloc(&augPath, XSIZE*YSIZE);
bool *visited = NULL;
hipMalloc(&visited, XSIZE*YSIZE);
int *frontier = NULL;
hipMalloc(&frontier, XSIZE*YSIZE);
bool *new_frontier = NULL;
hipMalloc(&new_frontier, XSIZE*YSIZE);
bool *par_mat = NULL;
hipMalloc(&par_mat, XSIZE*YSIZE);
int *cap_mat = NULL;
hipMalloc(&cap_mat, XSIZE*YSIZE);
bool *adj_mat = NULL;
hipMalloc(&adj_mat, XSIZE*YSIZE);
int *cap_max_mat = NULL;
hipMalloc(&cap_max_mat, XSIZE*YSIZE);
int *maxflow = NULL;
hipMalloc(&maxflow, XSIZE*YSIZE);
bool *augFound = NULL;
hipMalloc(&augFound, XSIZE*YSIZE);
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
k3<<<gridBlock, threadBlock>>>(N,augPath,visited,frontier,new_frontier,par_mat,cap_mat,adj_mat,cap_max_mat,maxflow,augFound);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
k3<<<gridBlock, threadBlock>>>(N,augPath,visited,frontier,new_frontier,par_mat,cap_mat,adj_mat,cap_max_mat,maxflow,augFound);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
k3<<<gridBlock, threadBlock>>>(N,augPath,visited,frontier,new_frontier,par_mat,cap_mat,adj_mat,cap_max_mat,maxflow,augFound);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}