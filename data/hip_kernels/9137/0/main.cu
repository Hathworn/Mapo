#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "BFSLevels.cu"
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
    int *vertices = NULL;
hipMalloc(&vertices, XSIZE*YSIZE);
int *edges = NULL;
hipMalloc(&edges, XSIZE*YSIZE);
int *distances = NULL;
hipMalloc(&distances, XSIZE*YSIZE);
int *predecessors = NULL;
hipMalloc(&predecessors, XSIZE*YSIZE);
int *vertIndices = NULL;
hipMalloc(&vertIndices, XSIZE*YSIZE);
int *edgeSize = NULL;
hipMalloc(&edgeSize, XSIZE*YSIZE);
bool *levels = NULL;
hipMalloc(&levels, XSIZE*YSIZE);
bool *visitedVertices = NULL;
hipMalloc(&visitedVertices, XSIZE*YSIZE);
bool *foundDest = NULL;
hipMalloc(&foundDest, XSIZE*YSIZE);
int numVert = 1;
int destination = 1;
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
BFSLevels<<<gridBlock, threadBlock>>>(vertices,edges,distances,predecessors,vertIndices,edgeSize,levels,visitedVertices,foundDest,numVert,destination);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
BFSLevels<<<gridBlock, threadBlock>>>(vertices,edges,distances,predecessors,vertIndices,edgeSize,levels,visitedVertices,foundDest,numVert,destination);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
BFSLevels<<<gridBlock, threadBlock>>>(vertices,edges,distances,predecessors,vertIndices,edgeSize,levels,visitedVertices,foundDest,numVert,destination);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}