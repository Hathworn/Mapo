#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "convolution_forward_kernel_llm.cu"
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
    float *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
float *filters = NULL;
hipMalloc(&filters, XSIZE*YSIZE);
float *feature_map = NULL;
hipMalloc(&feature_map, XSIZE*YSIZE);
float *hbias = NULL;
hipMalloc(&hbias, XSIZE*YSIZE);
int input_size = XSIZE*YSIZE;
int channel_num = 1;
int feature_map_size = XSIZE*YSIZE;
int filter_size = XSIZE*YSIZE;
int filter_num = 2;
int lu_padding = 1;
float sigma = 1;
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
convolution_forward_kernel<<<gridBlock, threadBlock>>>(input,filters,feature_map,hbias,input_size,channel_num,feature_map_size,filter_size,filter_num,lu_padding,sigma);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
convolution_forward_kernel<<<gridBlock, threadBlock>>>(input,filters,feature_map,hbias,input_size,channel_num,feature_map_size,filter_size,filter_num,lu_padding,sigma);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
convolution_forward_kernel<<<gridBlock, threadBlock>>>(input,filters,feature_map,hbias,input_size,channel_num,feature_map_size,filter_size,filter_num,lu_padding,sigma);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}