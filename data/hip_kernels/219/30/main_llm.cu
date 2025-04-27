#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "make_and_count_seg_llm.cu"
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
    float *vec = NULL;
hipMalloc(&vec, XSIZE*YSIZE);
int *bin = NULL;
hipMalloc(&bin, XSIZE*YSIZE);
int *segcounter = NULL;
hipMalloc(&segcounter, XSIZE*YSIZE);
const int length = 1;
const int countlength = 1;
const int HighLength = 1;
const int HighSegmentLength = 1;
const int threadsHigh = 1;
const int LowSegmentLength = 1;
const float low = 1;
const float high = 1;
const float slope = 1;
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
make_and_count_seg<<<gridBlock, threadBlock>>>(vec,bin,segcounter,length,countlength,HighLength,HighSegmentLength,threadsHigh,LowSegmentLength,low,high,slope);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
make_and_count_seg<<<gridBlock, threadBlock>>>(vec,bin,segcounter,length,countlength,HighLength,HighSegmentLength,threadsHigh,LowSegmentLength,low,high,slope);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
make_and_count_seg<<<gridBlock, threadBlock>>>(vec,bin,segcounter,length,countlength,HighLength,HighSegmentLength,threadsHigh,LowSegmentLength,low,high,slope);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}