#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cuSetupSincKernel_kernel_llm.cu"
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
    float *r_filter_ = NULL;
hipMalloc(&r_filter_, XSIZE*YSIZE);
const int i_filtercoef_ = 1;
const float r_soff_ = 1;
const float r_wgthgt_ = 1;
const int i_weight_ = 1;
const float r_soff_inverse_ = 1;
const float r_beta_ = 1;
const float r_decfactor_inverse_ = 1;
const float r_relfiltlen_inverse_ = 1;
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
cuSetupSincKernel_kernel<<<gridBlock, threadBlock>>>(r_filter_,i_filtercoef_,r_soff_,r_wgthgt_,i_weight_,r_soff_inverse_,r_beta_,r_decfactor_inverse_,r_relfiltlen_inverse_);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cuSetupSincKernel_kernel<<<gridBlock, threadBlock>>>(r_filter_,i_filtercoef_,r_soff_,r_wgthgt_,i_weight_,r_soff_inverse_,r_beta_,r_decfactor_inverse_,r_relfiltlen_inverse_);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cuSetupSincKernel_kernel<<<gridBlock, threadBlock>>>(r_filter_,i_filtercoef_,r_soff_,r_wgthgt_,i_weight_,r_soff_inverse_,r_beta_,r_decfactor_inverse_,r_relfiltlen_inverse_);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}