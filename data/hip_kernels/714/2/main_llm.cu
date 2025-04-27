#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "d_bucketsort_llm.cu"
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
    unsigned int *d_in = NULL;
hipMalloc(&d_in, XSIZE*YSIZE);
unsigned int *d_indices = NULL;
hipMalloc(&d_indices, XSIZE*YSIZE);
unsigned int *d_sublist = NULL;
hipMalloc(&d_sublist, XSIZE*YSIZE);
unsigned int *r_outputlist = NULL;
hipMalloc(&r_outputlist, XSIZE*YSIZE);
unsigned int *d_bucketoffsets = NULL;
hipMalloc(&d_bucketoffsets, XSIZE*YSIZE);
int itemCount = 1;
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
d_bucketsort<<<gridBlock, threadBlock>>>(d_in,d_indices,d_sublist,r_outputlist,d_bucketoffsets,itemCount);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
d_bucketsort<<<gridBlock, threadBlock>>>(d_in,d_indices,d_sublist,r_outputlist,d_bucketoffsets,itemCount);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
d_bucketsort<<<gridBlock, threadBlock>>>(d_in,d_indices,d_sublist,r_outputlist,d_bucketoffsets,itemCount);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}