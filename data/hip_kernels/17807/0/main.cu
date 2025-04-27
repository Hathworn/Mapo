#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "BFS_UNIFIED.cu"
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
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
BFS_UNIFIED<<<gridBlock, threadBlock>>>(source,edges,dest,label,visited,c_frontier_tail,c_frontier,p_frontier_tail,p_frontier);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
BFS_UNIFIED<<<gridBlock, threadBlock>>>(source,edges,dest,label,visited,c_frontier_tail,c_frontier,p_frontier_tail,p_frontier);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
BFS_UNIFIED<<<gridBlock, threadBlock>>>(source,edges,dest,label,visited,c_frontier_tail,c_frontier,p_frontier_tail,p_frontier);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}