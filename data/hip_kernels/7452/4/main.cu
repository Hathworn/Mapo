#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calculateFeatureDifference.cu"
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
    float *templateFeatures = NULL;
hipMalloc(&templateFeatures, XSIZE*YSIZE);
int colNumberM = 1;
int rowNumberN = 1;
float *l1SumTable = NULL;
hipMalloc(&l1SumTable, XSIZE*YSIZE);
float *l2SumTable = NULL;
hipMalloc(&l2SumTable, XSIZE*YSIZE);
float *lxSumTable = NULL;
hipMalloc(&lxSumTable, XSIZE*YSIZE);
float *lySumTable = NULL;
hipMalloc(&lySumTable, XSIZE*YSIZE);
int Kx = 1;
int Ky = 1;
float *differences = NULL;
hipMalloc(&differences, XSIZE*YSIZE);
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
calculateFeatureDifference<<<gridBlock, threadBlock>>>(templateFeatures,colNumberM,rowNumberN,l1SumTable,l2SumTable,lxSumTable,lySumTable,Kx,Ky,differences);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calculateFeatureDifference<<<gridBlock, threadBlock>>>(templateFeatures,colNumberM,rowNumberN,l1SumTable,l2SumTable,lxSumTable,lySumTable,Kx,Ky,differences);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calculateFeatureDifference<<<gridBlock, threadBlock>>>(templateFeatures,colNumberM,rowNumberN,l1SumTable,l2SumTable,lxSumTable,lySumTable,Kx,Ky,differences);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}