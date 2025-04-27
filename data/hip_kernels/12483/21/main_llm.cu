#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "set_chunk_data_llm.cu"
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
double dx = 1;
double dy = 1;
double *cell_x = NULL;
hipMalloc(&cell_x, XSIZE*YSIZE);
double *cell_y = NULL;
hipMalloc(&cell_y, XSIZE*YSIZE);
double *cell_dx = NULL;
hipMalloc(&cell_dx, XSIZE*YSIZE);
double *cell_dy = NULL;
hipMalloc(&cell_dy, XSIZE*YSIZE);
double *vertex_x = NULL;
hipMalloc(&vertex_x, XSIZE*YSIZE);
double *vertex_y = NULL;
hipMalloc(&vertex_y, XSIZE*YSIZE);
double *volume = NULL;
hipMalloc(&volume, XSIZE*YSIZE);
double *x_area = NULL;
hipMalloc(&x_area, XSIZE*YSIZE);
double *y_area = NULL;
hipMalloc(&y_area, XSIZE*YSIZE);
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
set_chunk_data<<<gridBlock, threadBlock>>>(x,y,dx,dy,cell_x,cell_y,cell_dx,cell_dy,vertex_x,vertex_y,volume,x_area,y_area);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
set_chunk_data<<<gridBlock, threadBlock>>>(x,y,dx,dy,cell_x,cell_y,cell_dx,cell_dy,vertex_x,vertex_y,volume,x_area,y_area);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
set_chunk_data<<<gridBlock, threadBlock>>>(x,y,dx,dy,cell_x,cell_y,cell_dx,cell_dy,vertex_x,vertex_y,volume,x_area,y_area);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}