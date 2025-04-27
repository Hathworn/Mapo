#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "histDupeKernel_llm.cu"
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
    const float *data1 = NULL;
hipMalloc(&data1, XSIZE*YSIZE);
const float *data2 = NULL;
hipMalloc(&data2, XSIZE*YSIZE);
const float *confidence1 = NULL;
hipMalloc(&confidence1, XSIZE*YSIZE);
const float *confidence2 = NULL;
hipMalloc(&confidence2, XSIZE*YSIZE);
int *ids1 = NULL;
hipMalloc(&ids1, XSIZE*YSIZE);
int *ids2 = NULL;
hipMalloc(&ids2, XSIZE*YSIZE);
int *results_id1 = NULL;
hipMalloc(&results_id1, XSIZE*YSIZE);
int *results_id2 = NULL;
hipMalloc(&results_id2, XSIZE*YSIZE);
float *results_similarity = NULL;
hipMalloc(&results_similarity, XSIZE*YSIZE);
int *result_count = NULL;
hipMalloc(&result_count, XSIZE*YSIZE);
const int N1 = 1;
const int N2 = 1;
const int max_results = 1;
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
histDupeKernel<<<gridBlock, threadBlock>>>(data1,data2,confidence1,confidence2,ids1,ids2,results_id1,results_id2,results_similarity,result_count,N1,N2,max_results);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
histDupeKernel<<<gridBlock, threadBlock>>>(data1,data2,confidence1,confidence2,ids1,ids2,results_id1,results_id2,results_similarity,result_count,N1,N2,max_results);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
histDupeKernel<<<gridBlock, threadBlock>>>(data1,data2,confidence1,confidence2,ids1,ids2,results_id1,results_id2,results_similarity,result_count,N1,N2,max_results);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}