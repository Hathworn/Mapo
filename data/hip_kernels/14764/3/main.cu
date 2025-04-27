#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_conv.cu"
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
    double2 *d_c = NULL;
hipMalloc(&d_c, XSIZE*YSIZE);
double *d_a = NULL;
hipMalloc(&d_a, XSIZE*YSIZE);
double2 *d_b = NULL;
hipMalloc(&d_b, XSIZE*YSIZE);
int *d_row_vect = NULL;
hipMalloc(&d_row_vect, XSIZE*YSIZE);
int *d_col_vect = NULL;
hipMalloc(&d_col_vect, XSIZE*YSIZE);
int ma = 1;
int na = 1;
int mb = 1;
int nb = 1;
int mc = 1;
int nc = 1;
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
kernel_conv<<<gridBlock, threadBlock>>>(d_c,d_a,d_b,d_row_vect,d_col_vect,ma,na,mb,nb,mc,nc);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_conv<<<gridBlock, threadBlock>>>(d_c,d_a,d_b,d_row_vect,d_col_vect,ma,na,mb,nb,mc,nc);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_conv<<<gridBlock, threadBlock>>>(d_c,d_a,d_b,d_row_vect,d_col_vect,ma,na,mb,nb,mc,nc);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}