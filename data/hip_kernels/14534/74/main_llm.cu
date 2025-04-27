#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "apply_gradient_with_weight_decay_util_kernel_llm.cu"
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
    const float2 __restrict *gradient = NULL;
hipMalloc(&gradient, XSIZE*YSIZE);
const float2 __restrict *learning_rates = NULL;
hipMalloc(&learning_rates, XSIZE*YSIZE);
float2 __restrict *weights = NULL;
hipMalloc(&weights, XSIZE*YSIZE);
float weight_decay = 1;
int elem_count = 1;
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
apply_gradient_with_weight_decay_util_kernel<<<gridBlock, threadBlock>>>(gradient,learning_rates,weights,weight_decay,elem_count);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
apply_gradient_with_weight_decay_util_kernel<<<gridBlock, threadBlock>>>(gradient,learning_rates,weights,weight_decay,elem_count);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
apply_gradient_with_weight_decay_util_kernel<<<gridBlock, threadBlock>>>(gradient,learning_rates,weights,weight_decay,elem_count);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}