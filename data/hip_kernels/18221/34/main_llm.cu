#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "update_linear_and_quadratic_terms_kernel_llm.cu"
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
    int32_t n = XSIZE*YSIZE;
float old_num_frames = 1;
float prior_offset = 1;
float *cur_tot_weight = NULL;
hipMalloc(&cur_tot_weight, XSIZE*YSIZE);
int32_t max_count = 1;
float *quadratic = NULL;
hipMalloc(&quadratic, XSIZE*YSIZE);
float *linear = NULL;
hipMalloc(&linear, XSIZE*YSIZE);
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
update_linear_and_quadratic_terms_kernel<<<gridBlock, threadBlock>>>(n,old_num_frames,prior_offset,cur_tot_weight,max_count,quadratic,linear);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
update_linear_and_quadratic_terms_kernel<<<gridBlock, threadBlock>>>(n,old_num_frames,prior_offset,cur_tot_weight,max_count,quadratic,linear);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
update_linear_and_quadratic_terms_kernel<<<gridBlock, threadBlock>>>(n,old_num_frames,prior_offset,cur_tot_weight,max_count,quadratic,linear);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}