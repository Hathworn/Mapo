#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "_mean_variance_backward_kernel.cu"
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
float *grad = NULL;
hipMalloc(&grad, XSIZE*YSIZE);
float *mean = NULL;
hipMalloc(&mean, XSIZE*YSIZE);
float *var = NULL;
hipMalloc(&var, XSIZE*YSIZE);
int b = 2;
int c = 2;
int wxh = 1;
float *mean_diff = NULL;
hipMalloc(&mean_diff, XSIZE*YSIZE);
float *var_diff = NULL;
hipMalloc(&var_diff, XSIZE*YSIZE);
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
_mean_variance_backward_kernel<<<gridBlock, threadBlock>>>(x,grad,mean,var,b,c,wxh,mean_diff,var_diff);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
_mean_variance_backward_kernel<<<gridBlock, threadBlock>>>(x,grad,mean,var,b,c,wxh,mean_diff,var_diff);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
_mean_variance_backward_kernel<<<gridBlock, threadBlock>>>(x,grad,mean,var,b,c,wxh,mean_diff,var_diff);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}