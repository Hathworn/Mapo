#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "dev_get_gravity_at_point.cu"
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
    float eps2 = 1;
float *eps = NULL;
hipMalloc(&eps, XSIZE*YSIZE);
float *xh = NULL;
hipMalloc(&xh, XSIZE*YSIZE);
float *yh = NULL;
hipMalloc(&yh, XSIZE*YSIZE);
float *zh = NULL;
hipMalloc(&zh, XSIZE*YSIZE);
float *xt = NULL;
hipMalloc(&xt, XSIZE*YSIZE);
float *yt = NULL;
hipMalloc(&yt, XSIZE*YSIZE);
float *zt = NULL;
hipMalloc(&zt, XSIZE*YSIZE);
float *ax = NULL;
hipMalloc(&ax, XSIZE*YSIZE);
float *ay = NULL;
hipMalloc(&ay, XSIZE*YSIZE);
float *az = NULL;
hipMalloc(&az, XSIZE*YSIZE);
int n = XSIZE*YSIZE;
float *field_m = NULL;
hipMalloc(&field_m, XSIZE*YSIZE);
float *fxh = NULL;
hipMalloc(&fxh, XSIZE*YSIZE);
float *fyh = NULL;
hipMalloc(&fyh, XSIZE*YSIZE);
float *fzh = NULL;
hipMalloc(&fzh, XSIZE*YSIZE);
float *fxt = NULL;
hipMalloc(&fxt, XSIZE*YSIZE);
float *fyt = NULL;
hipMalloc(&fyt, XSIZE*YSIZE);
float *fzt = NULL;
hipMalloc(&fzt, XSIZE*YSIZE);
int n_field = 1;
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
dev_get_gravity_at_point<<<gridBlock, threadBlock>>>(eps2,eps,xh,yh,zh,xt,yt,zt,ax,ay,az,n,field_m,fxh,fyh,fzh,fxt,fyt,fzt,n_field);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
dev_get_gravity_at_point<<<gridBlock, threadBlock>>>(eps2,eps,xh,yh,zh,xt,yt,zt,ax,ay,az,n,field_m,fxh,fyh,fzh,fxt,fyt,fzt,n_field);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
dev_get_gravity_at_point<<<gridBlock, threadBlock>>>(eps2,eps,xh,yh,zh,xt,yt,zt,ax,ay,az,n,field_m,fxh,fyh,fzh,fxt,fyt,fzt,n_field);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}