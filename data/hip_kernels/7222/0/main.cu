#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Test.cu"
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
    double *training_in_d = NULL;
hipMalloc(&training_in_d, XSIZE*YSIZE);
double *training_out_d = NULL;
hipMalloc(&training_out_d, XSIZE*YSIZE);
double *data_range_d = NULL;
hipMalloc(&data_range_d, XSIZE*YSIZE);
double *weights_in_d = NULL;
hipMalloc(&weights_in_d, XSIZE*YSIZE);
double *weights_out_d = NULL;
hipMalloc(&weights_out_d, XSIZE*YSIZE);
double *weights_h_d = NULL;
hipMalloc(&weights_h_d, XSIZE*YSIZE);
double *h_out_d = NULL;
hipMalloc(&h_out_d, XSIZE*YSIZE);
double *outputs_d = NULL;
hipMalloc(&outputs_d, XSIZE*YSIZE);
int inputs = 1;
int samples = 1;
int height = YSIZE;
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
Test<<<gridBlock, threadBlock>>>(training_in_d,training_out_d,data_range_d,weights_in_d,weights_out_d,weights_h_d,h_out_d,outputs_d,inputs,samples,height);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Test<<<gridBlock, threadBlock>>>(training_in_d,training_out_d,data_range_d,weights_in_d,weights_out_d,weights_h_d,h_out_d,outputs_d,inputs,samples,height);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Test<<<gridBlock, threadBlock>>>(training_in_d,training_out_d,data_range_d,weights_in_d,weights_out_d,weights_h_d,h_out_d,outputs_d,inputs,samples,height);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}