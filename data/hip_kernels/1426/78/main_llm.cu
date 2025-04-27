#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computePointGradients1_llm.cu"
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
double *dj_ang = NULL;
hipMalloc(&dj_ang, XSIZE*YSIZE);
double *pg24 = NULL;
hipMalloc(&pg24, XSIZE*YSIZE);
double *pg05 = NULL;
hipMalloc(&pg05, XSIZE*YSIZE);
double *pg15 = NULL;
hipMalloc(&pg15, XSIZE*YSIZE);
double *pg25 = NULL;
hipMalloc(&pg25, XSIZE*YSIZE);
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
computePointGradients1<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dj_ang,pg24,pg05,pg15,pg25);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computePointGradients1<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dj_ang,pg24,pg05,pg15,pg25);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computePointGradients1<<<gridBlock, threadBlock>>>(x,y,z,points_num,valid_points,valid_points_num,dj_ang,pg24,pg05,pg15,pg25);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}