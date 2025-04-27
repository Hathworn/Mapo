#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "update_mask_kernel_llm.cu"
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
    size_t batch_size = XSIZE*YSIZE;
uint32_t *d_rrr_index = NULL;
hipMalloc(&d_rrr_index, XSIZE*YSIZE);
uint32_t *d_rrr_sets = NULL;
hipMalloc(&d_rrr_sets, XSIZE*YSIZE);
char *d_mask = NULL;
hipMalloc(&d_mask, XSIZE*YSIZE);
uint32_t last_seed = 1;
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
update_mask_kernel<<<gridBlock, threadBlock>>>(batch_size,d_rrr_index,d_rrr_sets,d_mask,last_seed);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
update_mask_kernel<<<gridBlock, threadBlock>>>(batch_size,d_rrr_index,d_rrr_sets,d_mask,last_seed);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
update_mask_kernel<<<gridBlock, threadBlock>>>(batch_size,d_rrr_index,d_rrr_sets,d_mask,last_seed);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}