#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CopyOutBack.cu"
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
    float4 *d_tetT = NULL;
hipMalloc(&d_tetT, XSIZE*YSIZE);
float *d_vertT = NULL;
hipMalloc(&d_vertT, XSIZE*YSIZE);
int *d_vertMem = NULL;
hipMalloc(&d_vertMem, XSIZE*YSIZE);
int *d_vertMemOutside = NULL;
hipMalloc(&d_vertMemOutside, XSIZE*YSIZE);
int *d_BlockSizes = NULL;
hipMalloc(&d_BlockSizes, XSIZE*YSIZE);
int *d_ActiveList = NULL;
hipMalloc(&d_ActiveList, XSIZE*YSIZE);
int m_maxNumInVert = 1;
int m_maxNumTotalTets = 1;
int m_maxVertMappingInside = 1;
int m_maxVertMappingOutside = 1;
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
CopyOutBack<<<gridBlock, threadBlock>>>(d_tetT,d_vertT,d_vertMem,d_vertMemOutside,d_BlockSizes,d_ActiveList,m_maxNumInVert,m_maxNumTotalTets,m_maxVertMappingInside,m_maxVertMappingOutside);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CopyOutBack<<<gridBlock, threadBlock>>>(d_tetT,d_vertT,d_vertMem,d_vertMemOutside,d_BlockSizes,d_ActiveList,m_maxNumInVert,m_maxNumTotalTets,m_maxVertMappingInside,m_maxVertMappingOutside);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CopyOutBack<<<gridBlock, threadBlock>>>(d_tetT,d_vertT,d_vertMem,d_vertMemOutside,d_BlockSizes,d_ActiveList,m_maxNumInVert,m_maxNumTotalTets,m_maxVertMappingInside,m_maxVertMappingOutside);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}