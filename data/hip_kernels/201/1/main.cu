#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "binning_mix.cu"
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
    float *xd_real = NULL;
hipMalloc(&xd_real, XSIZE*YSIZE);
float *yd_real = NULL;
hipMalloc(&yd_real, XSIZE*YSIZE);
float *zd_real = NULL;
hipMalloc(&zd_real, XSIZE*YSIZE);
float *xd_sim = NULL;
hipMalloc(&xd_sim, XSIZE*YSIZE);
float *yd_sim = NULL;
hipMalloc(&yd_sim, XSIZE*YSIZE);
float *zd_sim = NULL;
hipMalloc(&zd_sim, XSIZE*YSIZE);
float *ZY = NULL;
hipMalloc(&ZY, XSIZE*YSIZE);
int lines_number_1 = 1;
int lines_number_2 = 1;
int points_per_degree = 1;
int number_of_degrees = 1;
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
binning_mix<<<gridBlock, threadBlock>>>(xd_real,yd_real,zd_real,xd_sim,yd_sim,zd_sim,ZY,lines_number_1,lines_number_2,points_per_degree,number_of_degrees);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
binning_mix<<<gridBlock, threadBlock>>>(xd_real,yd_real,zd_real,xd_sim,yd_sim,zd_sim,ZY,lines_number_1,lines_number_2,points_per_degree,number_of_degrees);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
binning_mix<<<gridBlock, threadBlock>>>(xd_real,yd_real,zd_real,xd_sim,yd_sim,zd_sim,ZY,lines_number_1,lines_number_2,points_per_degree,number_of_degrees);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}