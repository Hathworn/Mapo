#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "recombiner.cu"
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
    double *rands = NULL;
hipMalloc(&rands, XSIZE*YSIZE);
unsigned int *parents = NULL;
hipMalloc(&parents, XSIZE*YSIZE);
unsigned int parent_rows = 1;
unsigned int parent_cols = 1;
unsigned int *off = NULL;
hipMalloc(&off, XSIZE*YSIZE);
unsigned int cols = 1;
unsigned int seq_offset = 1;
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
recombiner<<<gridBlock, threadBlock>>>(rands,parents,parent_rows,parent_cols,off,cols,seq_offset);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
recombiner<<<gridBlock, threadBlock>>>(rands,parents,parent_rows,parent_cols,off,cols,seq_offset);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
recombiner<<<gridBlock, threadBlock>>>(rands,parents,parent_rows,parent_cols,off,cols,seq_offset);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}