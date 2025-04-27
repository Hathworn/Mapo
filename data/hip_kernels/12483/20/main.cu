#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "set_chunk_data_vertices.cu"
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
    int x = 1;
int y = 1;
int halo_depth = 1;
double dx = 1;
double dy = 1;
double x_min = 1;
double y_min = 1;
double *vertex_x = NULL;
hipMalloc(&vertex_x, XSIZE*YSIZE);
double *vertex_y = NULL;
hipMalloc(&vertex_y, XSIZE*YSIZE);
double *vertex_dx = NULL;
hipMalloc(&vertex_dx, XSIZE*YSIZE);
double *vertex_dy = NULL;
hipMalloc(&vertex_dy, XSIZE*YSIZE);
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
set_chunk_data_vertices<<<gridBlock, threadBlock>>>(x,y,halo_depth,dx,dy,x_min,y_min,vertex_x,vertex_y,vertex_dx,vertex_dy);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
set_chunk_data_vertices<<<gridBlock, threadBlock>>>(x,y,halo_depth,dx,dy,x_min,y_min,vertex_x,vertex_y,vertex_dx,vertex_dy);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
set_chunk_data_vertices<<<gridBlock, threadBlock>>>(x,y,halo_depth,dx,dy,x_min,y_min,vertex_x,vertex_y,vertex_dx,vertex_dy);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}