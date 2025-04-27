#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "wireless_src_pulse_kernel_llm.cu"
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
    int step = 1;
double amp = 1;
double MAX_TIME = 1;
double TIME_STEP = 1;
int radius = 1;
int source_active = 1;
int src_x = 1;
int src_y = 1;
double *ua_gpu = NULL;
hipMalloc(&ua_gpu, XSIZE*YSIZE);
double *ub_gpu = NULL;
hipMalloc(&ub_gpu, XSIZE*YSIZE);
double *uc_gpu = NULL;
hipMalloc(&uc_gpu, XSIZE*YSIZE);
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
wireless_src_pulse_kernel<<<gridBlock, threadBlock>>>(step,amp,MAX_TIME,TIME_STEP,radius,source_active,src_x,src_y,ua_gpu,ub_gpu,uc_gpu);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
wireless_src_pulse_kernel<<<gridBlock, threadBlock>>>(step,amp,MAX_TIME,TIME_STEP,radius,source_active,src_x,src_y,ua_gpu,ub_gpu,uc_gpu);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
wireless_src_pulse_kernel<<<gridBlock, threadBlock>>>(step,amp,MAX_TIME,TIME_STEP,radius,source_active,src_x,src_y,ua_gpu,ub_gpu,uc_gpu);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}