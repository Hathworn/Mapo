#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpu_unmix24.cu"
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
    int32_t *u = NULL;
hipMalloc(&u, XSIZE*YSIZE);
int32_t *v = NULL;
hipMalloc(&v, XSIZE*YSIZE);
uint8_t *out = NULL;
hipMalloc(&out, XSIZE*YSIZE);
uint32_t stride = 2;
uint32_t *numSamples = NULL;
hipMalloc(&numSamples, XSIZE*YSIZE);
int32_t *mixbits = NULL;
hipMalloc(&mixbits, XSIZE*YSIZE);
int32_t *mixres = NULL;
hipMalloc(&mixres, XSIZE*YSIZE);
uint16_t *shiftUV = NULL;
hipMalloc(&shiftUV, XSIZE*YSIZE);
int32_t bytesShifted = 1;
int32_t theOutputPacketBytes = 1;
uint32_t frameLength = 1;
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
gpu_unmix24<<<gridBlock, threadBlock>>>(u,v,out,stride,numSamples,mixbits,mixres,shiftUV,bytesShifted,theOutputPacketBytes,frameLength);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpu_unmix24<<<gridBlock, threadBlock>>>(u,v,out,stride,numSamples,mixbits,mixres,shiftUV,bytesShifted,theOutputPacketBytes,frameLength);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpu_unmix24<<<gridBlock, threadBlock>>>(u,v,out,stride,numSamples,mixbits,mixres,shiftUV,bytesShifted,theOutputPacketBytes,frameLength);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}