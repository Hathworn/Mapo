#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computePointHessian0.cu"
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
    float *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
float *y = NULL;
hipMalloc(&y, XSIZE*YSIZE);
float *z = NULL;
hipMalloc(&z, XSIZE*YSIZE);
int points_num = 1;
int *valid_points = NULL;
hipMalloc(&valid_points, XSIZE*YSIZE);
int valid_points_num = 1;
double *dh_ang = NULL;
hipMalloc(&dh_ang, XSIZE*YSIZE);
double *ph93 = NULL;
hipMalloc(&ph93, XSIZE*YSIZE);
double *ph103 = NULL;
hipMalloc(&ph103, XSIZE*YSIZE);
double *ph113 = NULL;
hipMalloc(&ph113, XSIZE*YSIZE);
double *ph123 = NULL;
hipMalloc(&ph123, XSIZE*YSIZE);
double *ph94 = NULL;
hipMalloc(&ph94, XSIZE*YSIZE);
double *ph133 = NULL;
hipMalloc(&ph133, XSIZE*YSIZE);
double *ph104 = NULL;
hipMalloc(&ph104, XSIZE*YSIZE);
double *ph143 = NULL;
hipMalloc(&ph143, XSIZE*YSIZE);
double *ph114 = NULL;
hipMalloc(&ph114, XSIZE*YSIZE);
double *ph153 = NULL;
hipMalloc(&ph153, XSIZE*YSIZE);
double *ph95 = NULL;
hipMalloc(&ph95, XSIZE*YSIZE);
double *ph163 = NULL;
hipMalloc(&ph163, XSIZE*YSIZE);
double *ph105 = NULL;
hipMalloc(&ph105, XSIZE*YSIZE);
double *ph173 = NULL;
hipMalloc(&ph173, XSIZE*YSIZE);
double *ph115 = NULL;
hipMalloc(&ph115, XSIZE*YSIZE);
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
computePointHessian0<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dh_ang,ph93,ph103,ph113,ph123,ph94,ph133,ph104,ph143,ph114,ph153,ph95,ph163,ph105,ph173,ph115);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computePointHessian0<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dh_ang,ph93,ph103,ph113,ph123,ph94,ph133,ph104,ph143,ph114,ph153,ph95,ph163,ph105,ph173,ph115);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computePointHessian0<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dh_ang,ph93,ph103,ph113,ph123,ph94,ph133,ph104,ph143,ph114,ph153,ph95,ph163,ph105,ph173,ph115);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}