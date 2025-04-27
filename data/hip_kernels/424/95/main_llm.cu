#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "copyChunks_kernel_llm.cu"
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
    void *d_source = NULL;
hipMalloc(&d_source, XSIZE*YSIZE);
int startPos = 1;
int2 *d_Rin = NULL;
hipMalloc(&d_Rin, XSIZE*YSIZE);
int rLen = 1;
int *d_sum = NULL;
hipMalloc(&d_sum, XSIZE*YSIZE);
void *d_dest = NULL;
hipMalloc(&d_dest, XSIZE*YSIZE);
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
copyChunks_kernel<<<gridBlock, threadBlock>>>(d_source,startPos,d_Rin,rLen,d_sum,d_dest);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
copyChunks_kernel<<<gridBlock, threadBlock>>>(d_source,startPos,d_Rin,rLen,d_sum,d_dest);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
copyChunks_kernel<<<gridBlock, threadBlock>>>(d_source,startPos,d_Rin,rLen,d_sum,d_dest);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}