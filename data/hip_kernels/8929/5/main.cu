#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "writeSeedList.cu"
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
    const int idxLimit = 1;
const int *gatewayIndexArray = NULL;
hipMalloc(&gatewayIndexArray, XSIZE*YSIZE);
const int *indexArray = NULL;
hipMalloc(&indexArray, XSIZE*YSIZE);
const int *seedWriteIndexArray = NULL;
hipMalloc(&seedWriteIndexArray, XSIZE*YSIZE);
const int *cellSizeArray = NULL;
hipMalloc(&cellSizeArray, XSIZE*YSIZE);
const int *tIDArray = NULL;
hipMalloc(&tIDArray, XSIZE*YSIZE);
const int *tIndexArray = NULL;
hipMalloc(&tIndexArray, XSIZE*YSIZE);
const int *qIDArray = NULL;
hipMalloc(&qIDArray, XSIZE*YSIZE);
const int *qIndexArray = NULL;
hipMalloc(&qIndexArray, XSIZE*YSIZE);
int *target_IDArray = NULL;
hipMalloc(&target_IDArray, XSIZE*YSIZE);
int *target_indexArray = NULL;
hipMalloc(&target_indexArray, XSIZE*YSIZE);
int *query_IDArray = NULL;
hipMalloc(&query_IDArray, XSIZE*YSIZE);
int *query_indexArray = NULL;
hipMalloc(&query_indexArray, XSIZE*YSIZE);
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
writeSeedList<<<gridBlock, threadBlock>>>(idxLimit,gatewayIndexArray,indexArray,seedWriteIndexArray,cellSizeArray,tIDArray,tIndexArray,qIDArray,qIndexArray,target_IDArray,target_indexArray,query_IDArray,query_indexArray);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
writeSeedList<<<gridBlock, threadBlock>>>(idxLimit,gatewayIndexArray,indexArray,seedWriteIndexArray,cellSizeArray,tIDArray,tIndexArray,qIDArray,qIndexArray,target_IDArray,target_indexArray,query_IDArray,query_indexArray);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
writeSeedList<<<gridBlock, threadBlock>>>(idxLimit,gatewayIndexArray,indexArray,seedWriteIndexArray,cellSizeArray,tIDArray,tIndexArray,qIDArray,qIndexArray,target_IDArray,target_indexArray,query_IDArray,query_indexArray);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}