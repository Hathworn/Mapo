#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "compute_distance_texture.cu"
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
    cudaTextureObject_t ref = 1;
int ref_width = XSIZE;
float *query = NULL;
hipMalloc(&query, XSIZE*YSIZE);
int query_width = XSIZE;
int query_pitch = 2;
int height = YSIZE;
float *dist = NULL;
hipMalloc(&dist, XSIZE*YSIZE);
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
compute_distance_texture<<<gridBlock, threadBlock>>>(ref,ref_width,query,query_width,query_pitch,height,dist);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
compute_distance_texture<<<gridBlock, threadBlock>>>(ref,ref_width,query,query_width,query_pitch,height,dist);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
compute_distance_texture<<<gridBlock, threadBlock>>>(ref,ref_width,query,query_width,query_pitch,height,dist);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}