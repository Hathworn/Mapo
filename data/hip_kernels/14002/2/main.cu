#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "opt_cond_itr.cu"
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
    int num_train_cases = 1;
double *opt_cond = NULL;
hipMalloc(&opt_cond, XSIZE*YSIZE);
double alpha_high = 2;
double alpha_high_prev = 2;
int high_label = 1;
int high_indx = 1;
double alpha_low = 2;
double alpha_low_prev = 2;
int low_label = 1;
int low_indx = 1;
double *kernel_val_mat = NULL;
hipMalloc(&kernel_val_mat, XSIZE*YSIZE);
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
opt_cond_itr<<<gridBlock, threadBlock>>>(num_train_cases,opt_cond,alpha_high,alpha_high_prev,high_label,high_indx,alpha_low,alpha_low_prev,low_label,low_indx,kernel_val_mat);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
opt_cond_itr<<<gridBlock, threadBlock>>>(num_train_cases,opt_cond,alpha_high,alpha_high_prev,high_label,high_indx,alpha_low,alpha_low_prev,low_label,low_indx,kernel_val_mat);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
opt_cond_itr<<<gridBlock, threadBlock>>>(num_train_cases,opt_cond,alpha_high,alpha_high_prev,high_label,high_indx,alpha_low,alpha_low_prev,low_label,low_indx,kernel_val_mat);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}