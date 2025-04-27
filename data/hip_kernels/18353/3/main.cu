#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "awkward_Content_getitem_next_missing_jagged_getmaskstartstop_kernel.cu"
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
    int64_t *prefixed_index = NULL;
hipMalloc(&prefixed_index, XSIZE*YSIZE);
int64_t *index_in = NULL;
hipMalloc(&index_in, XSIZE*YSIZE);
int64_t *offsets_in = NULL;
hipMalloc(&offsets_in, XSIZE*YSIZE);
int64_t *mask_out = NULL;
hipMalloc(&mask_out, XSIZE*YSIZE);
int64_t *starts_out = NULL;
hipMalloc(&starts_out, XSIZE*YSIZE);
int64_t *stops_out = NULL;
hipMalloc(&stops_out, XSIZE*YSIZE);
int64_t length = 1;
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
awkward_Content_getitem_next_missing_jagged_getmaskstartstop_kernel<<<gridBlock, threadBlock>>>(prefixed_index,index_in,offsets_in,mask_out,starts_out,stops_out,length);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
awkward_Content_getitem_next_missing_jagged_getmaskstartstop_kernel<<<gridBlock, threadBlock>>>(prefixed_index,index_in,offsets_in,mask_out,starts_out,stops_out,length);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
awkward_Content_getitem_next_missing_jagged_getmaskstartstop_kernel<<<gridBlock, threadBlock>>>(prefixed_index,index_in,offsets_in,mask_out,starts_out,stops_out,length);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}