#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "subsample_ind_and_labels_GPU_llm.cu"
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
    int *d_ind_sub = NULL;
hipMalloc(&d_ind_sub, XSIZE*YSIZE);
const int *d_ind = NULL;
hipMalloc(&d_ind, XSIZE*YSIZE);
unsigned int *d_label_sub = NULL;
hipMalloc(&d_label_sub, XSIZE*YSIZE);
const unsigned int *d_label = NULL;
hipMalloc(&d_label, XSIZE*YSIZE);
int n_out = 1;
float inv_sub_factor = 1;
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
subsample_ind_and_labels_GPU<<<gridBlock, threadBlock>>>(d_ind_sub,d_ind,d_label_sub,d_label,n_out,inv_sub_factor);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
subsample_ind_and_labels_GPU<<<gridBlock, threadBlock>>>(d_ind_sub,d_ind,d_label_sub,d_label,n_out,inv_sub_factor);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
subsample_ind_and_labels_GPU<<<gridBlock, threadBlock>>>(d_ind_sub,d_ind,d_label_sub,d_label,n_out,inv_sub_factor);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}