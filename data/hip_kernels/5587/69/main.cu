#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computePointHessian1.cu"
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
double *ph124 = NULL;
hipMalloc(&ph124, XSIZE*YSIZE);
double *ph134 = NULL;
hipMalloc(&ph134, XSIZE*YSIZE);
double *ph144 = NULL;
hipMalloc(&ph144, XSIZE*YSIZE);
double *ph154 = NULL;
hipMalloc(&ph154, XSIZE*YSIZE);
double *ph125 = NULL;
hipMalloc(&ph125, XSIZE*YSIZE);
double *ph164 = NULL;
hipMalloc(&ph164, XSIZE*YSIZE);
double *ph135 = NULL;
hipMalloc(&ph135, XSIZE*YSIZE);
double *ph174 = NULL;
hipMalloc(&ph174, XSIZE*YSIZE);
double *ph145 = NULL;
hipMalloc(&ph145, XSIZE*YSIZE);
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
computePointHessian1<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dh_ang,ph124,ph134,ph144,ph154,ph125,ph164,ph135,ph174,ph145);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computePointHessian1<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dh_ang,ph124,ph134,ph144,ph154,ph125,ph164,ph135,ph174,ph145);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computePointHessian1<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dh_ang,ph124,ph134,ph144,ph154,ph125,ph164,ph135,ph174,ph145);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}