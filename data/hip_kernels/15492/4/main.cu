#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "tensor_5d_equals.cu"
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
    const int n = 1;
const int c = 1;
const int d = 1;
const int h = 1;
const int w = 1;
const DTYPE *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
const int offset_x = 1;
const int n_x = 1;
const int c_x = 1;
const int d_x = 1;
const int h_x = 1;
const int w_x = 1;
const DTYPE *y = NULL;
hipMalloc(&y, XSIZE*YSIZE);
const int offset_y = 1;
const int n_y = 1;
const int c_y = 1;
const int d_y = 1;
const int h_y = 1;
const int w_y = 1;
int *eq_flag = NULL;
hipMalloc(&eq_flag, XSIZE*YSIZE);
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
tensor_5d_equals<<<gridBlock, threadBlock>>>(n,c,d,h,w,x,offset_x,n_x,c_x,d_x,h_x,w_x,y,offset_y,n_y,c_y,d_y,h_y,w_y,eq_flag);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
tensor_5d_equals<<<gridBlock, threadBlock>>>(n,c,d,h,w,x,offset_x,n_x,c_x,d_x,h_x,w_x,y,offset_y,n_y,c_y,d_y,h_y,w_y,eq_flag);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
tensor_5d_equals<<<gridBlock, threadBlock>>>(n,c,d,h,w,x,offset_x,n_x,c_x,d_x,h_x,w_x,y,offset_y,n_y,c_y,d_y,h_y,w_y,eq_flag);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}