#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "set_packed_cl_cs.cu"
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
    int *d_packed_cl = NULL;
hipMalloc(&d_packed_cl, XSIZE*YSIZE);
int *d_packed_cs = NULL;
hipMalloc(&d_packed_cs, XSIZE*YSIZE);
int *d_cl = NULL;
hipMalloc(&d_cl, XSIZE*YSIZE);
int *d_cs = NULL;
hipMalloc(&d_cs, XSIZE*YSIZE);
int *d_gcs = NULL;
hipMalloc(&d_gcs, XSIZE*YSIZE);
int chunk_num = 1;
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
set_packed_cl_cs<<<gridBlock, threadBlock>>>(d_packed_cl,d_packed_cs,d_cl,d_cs,d_gcs,chunk_num);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
set_packed_cl_cs<<<gridBlock, threadBlock>>>(d_packed_cl,d_packed_cs,d_cl,d_cs,d_gcs,chunk_num);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
set_packed_cl_cs<<<gridBlock, threadBlock>>>(d_packed_cl,d_packed_cs,d_cl,d_cs,d_gcs,chunk_num);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}