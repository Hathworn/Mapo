#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CalculateDistanceAllPoints.cu"
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
    double *data_x_d = NULL;
hipMalloc(&data_x_d, XSIZE*YSIZE);
double *data_y_d = NULL;
hipMalloc(&data_y_d, XSIZE*YSIZE);
double *data_z_d = NULL;
hipMalloc(&data_z_d, XSIZE*YSIZE);
double *transformed_data_x_d = NULL;
hipMalloc(&transformed_data_x_d, XSIZE*YSIZE);
double *transformed_data_y_d = NULL;
hipMalloc(&transformed_data_y_d, XSIZE*YSIZE);
double *transformed_data_z_d = NULL;
hipMalloc(&transformed_data_z_d, XSIZE*YSIZE);
int *index_d = NULL;
hipMalloc(&index_d, XSIZE*YSIZE);
double *distance_d = NULL;
hipMalloc(&distance_d, XSIZE*YSIZE);
int size_data = XSIZE*YSIZE;
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
CalculateDistanceAllPoints<<<gridBlock, threadBlock>>>(data_x_d,data_y_d,data_z_d,transformed_data_x_d,transformed_data_y_d,transformed_data_z_d,index_d,distance_d,size_data);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CalculateDistanceAllPoints<<<gridBlock, threadBlock>>>(data_x_d,data_y_d,data_z_d,transformed_data_x_d,transformed_data_y_d,transformed_data_z_d,index_d,distance_d,size_data);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CalculateDistanceAllPoints<<<gridBlock, threadBlock>>>(data_x_d,data_y_d,data_z_d,transformed_data_x_d,transformed_data_y_d,transformed_data_z_d,index_d,distance_d,size_data);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}