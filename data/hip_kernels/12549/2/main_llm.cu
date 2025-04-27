#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "lin2lin_resmpl_good_gpu_kernel_llm.cu"
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
    float *dev_in_img = NULL;
hipMalloc(&dev_in_img, XSIZE*YSIZE);
float *dev_out_img = NULL;
hipMalloc(&dev_out_img, XSIZE*YSIZE);
float *dev_C0_tmp = NULL;
hipMalloc(&dev_C0_tmp, XSIZE*YSIZE);
float *dev_C1_tmp = NULL;
hipMalloc(&dev_C1_tmp, XSIZE*YSIZE);
float *dev_C2_tmp = NULL;
hipMalloc(&dev_C2_tmp, XSIZE*YSIZE);
int org_wd = 1;
int org_ht = 1;
int dst_wd = 1;
int dst_ht = 1;
int n_channels = 1;
float r = 1;
int *yas_const = NULL;
hipMalloc(&yas_const, XSIZE*YSIZE);
int *ybs_const = NULL;
hipMalloc(&ybs_const, XSIZE*YSIZE);
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
lin2lin_resmpl_good_gpu_kernel<<<gridBlock, threadBlock>>>(dev_in_img,dev_out_img,dev_C0_tmp,dev_C1_tmp,dev_C2_tmp,org_wd,org_ht,dst_wd,dst_ht,n_channels,r,yas_const,ybs_const);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
lin2lin_resmpl_good_gpu_kernel<<<gridBlock, threadBlock>>>(dev_in_img,dev_out_img,dev_C0_tmp,dev_C1_tmp,dev_C2_tmp,org_wd,org_ht,dst_wd,dst_ht,n_channels,r,yas_const,ybs_const);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
lin2lin_resmpl_good_gpu_kernel<<<gridBlock, threadBlock>>>(dev_in_img,dev_out_img,dev_C0_tmp,dev_C1_tmp,dev_C2_tmp,org_wd,org_ht,dst_wd,dst_ht,n_channels,r,yas_const,ybs_const);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}