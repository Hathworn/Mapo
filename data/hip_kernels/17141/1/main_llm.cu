#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "GaussianNBMeanKernel_llm.cu"
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
    float *feature_means_ = NULL;
hipMalloc(&feature_means_, XSIZE*YSIZE);
int *class_count_ = NULL;
hipMalloc(&class_count_, XSIZE*YSIZE);
float *class_priors_ = NULL;
hipMalloc(&class_priors_, XSIZE*YSIZE);
unsigned int n_samples_ = 1;
unsigned int n_classes_ = 1;
unsigned int n_features_ = 1;
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
GaussianNBMeanKernel<<<gridBlock, threadBlock>>>(feature_means_,class_count_,class_priors_,n_samples_,n_classes_,n_features_);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
GaussianNBMeanKernel<<<gridBlock, threadBlock>>>(feature_means_,class_count_,class_priors_,n_samples_,n_classes_,n_features_);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
GaussianNBMeanKernel<<<gridBlock, threadBlock>>>(feature_means_,class_count_,class_priors_,n_samples_,n_classes_,n_features_);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}