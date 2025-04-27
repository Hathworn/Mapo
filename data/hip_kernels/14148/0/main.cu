#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpu_mvprod.cu"
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
    double *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
double *y = NULL;
hipMalloc(&y, XSIZE*YSIZE);
double alpha = 2;
int NumUp = 1;
int NumDown = 1;
int dim = 2;
double *Umat = NULL;
hipMalloc(&Umat, XSIZE*YSIZE);
double *Down_data = NULL;
hipMalloc(&Down_data, XSIZE*YSIZE);
unsigned int *Down_ind = NULL;
hipMalloc(&Down_ind, XSIZE*YSIZE);
int size_Down = XSIZE*YSIZE;
double *Up_data = NULL;
hipMalloc(&Up_data, XSIZE*YSIZE);
unsigned int *Up_ind = NULL;
hipMalloc(&Up_ind, XSIZE*YSIZE);
int size_Up = XSIZE*YSIZE;
int rows_shared = 1;
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
gpu_mvprod<<<gridBlock, threadBlock>>>(x,y,alpha,NumUp,NumDown,dim,Umat,Down_data,Down_ind,size_Down,Up_data,Up_ind,size_Up,rows_shared);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpu_mvprod<<<gridBlock, threadBlock>>>(x,y,alpha,NumUp,NumDown,dim,Umat,Down_data,Down_ind,size_Down,Up_data,Up_ind,size_Up,rows_shared);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpu_mvprod<<<gridBlock, threadBlock>>>(x,y,alpha,NumUp,NumDown,dim,Umat,Down_data,Down_ind,size_Down,Up_data,Up_ind,size_Up,rows_shared);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}