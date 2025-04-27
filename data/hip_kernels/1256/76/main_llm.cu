#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "BFS_kernel_one_block_llm.cu"
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
    volatile unsigned int *frontier = NULL;
hipMalloc(&frontier, XSIZE*YSIZE);
unsigned int frontier_len = 1;
volatile unsigned int *cost = NULL;
hipMalloc(&cost, XSIZE*YSIZE);
volatile int *visited = NULL;
hipMalloc(&visited, XSIZE*YSIZE);
unsigned int *edgeArray = NULL;
hipMalloc(&edgeArray, XSIZE*YSIZE);
unsigned int *edgeArrayAux = NULL;
hipMalloc(&edgeArrayAux, XSIZE*YSIZE);
unsigned int numVertices = 1;
unsigned int numEdges = 1;
volatile unsigned int *frontier_length = NULL;
hipMalloc(&frontier_length, XSIZE*YSIZE);
unsigned int num_p_per_mp = 1;
unsigned int w_q_size = 1;
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
BFS_kernel_one_block<<<gridBlock, threadBlock>>>(frontier,frontier_len,cost,visited,edgeArray,edgeArrayAux,numVertices,numEdges,frontier_length,num_p_per_mp,w_q_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
BFS_kernel_one_block<<<gridBlock, threadBlock>>>(frontier,frontier_len,cost,visited,edgeArray,edgeArrayAux,numVertices,numEdges,frontier_length,num_p_per_mp,w_q_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
BFS_kernel_one_block<<<gridBlock, threadBlock>>>(frontier,frontier_len,cost,visited,edgeArray,edgeArrayAux,numVertices,numEdges,frontier_length,num_p_per_mp,w_q_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}