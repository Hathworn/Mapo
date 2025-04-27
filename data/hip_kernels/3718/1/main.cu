#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "create_bin_expimages.cu"
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
    char *acExpDetImages = NULL;
hipMalloc(&acExpDetImages, XSIZE*YSIZE);
const int *aiDetStartIdx = NULL;
hipMalloc(&aiDetStartIdx, XSIZE*YSIZE);
const float *afDetInfo = NULL;
hipMalloc(&afDetInfo, XSIZE*YSIZE);
const int iNDet = 1;
const int iNRot = 1;
const int *aiDetIndex = NULL;
hipMalloc(&aiDetIndex, XSIZE*YSIZE);
const int *aiRotN = NULL;
hipMalloc(&aiRotN, XSIZE*YSIZE);
const int *aiJExp = NULL;
hipMalloc(&aiJExp, XSIZE*YSIZE);
const int *aiKExp = NULL;
hipMalloc(&aiKExp, XSIZE*YSIZE);
int const iNPeak = 1;
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
create_bin_expimages<<<gridBlock, threadBlock>>>(acExpDetImages,aiDetStartIdx,afDetInfo,iNDet,iNRot,aiDetIndex,aiRotN,aiJExp,aiKExp,iNPeak);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
create_bin_expimages<<<gridBlock, threadBlock>>>(acExpDetImages,aiDetStartIdx,afDetInfo,iNDet,iNRot,aiDetIndex,aiRotN,aiJExp,aiKExp,iNPeak);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
create_bin_expimages<<<gridBlock, threadBlock>>>(acExpDetImages,aiDetStartIdx,afDetInfo,iNDet,iNRot,aiDetIndex,aiRotN,aiJExp,aiKExp,iNPeak);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}