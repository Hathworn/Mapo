#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "wlcss_cuda_kernel_llm.cu"
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
    int32_t *d_mss = NULL;
hipMalloc(&d_mss, XSIZE*YSIZE);
int32_t *d_mss_offsets = NULL;
hipMalloc(&d_mss_offsets, XSIZE*YSIZE);
int32_t *d_ts = NULL;
hipMalloc(&d_ts, XSIZE*YSIZE);
int32_t *d_ss = NULL;
hipMalloc(&d_ss, XSIZE*YSIZE);
int32_t *d_tlen = NULL;
hipMalloc(&d_tlen, XSIZE*YSIZE);
int32_t *d_toffsets = NULL;
hipMalloc(&d_toffsets, XSIZE*YSIZE);
int32_t *d_slen = NULL;
hipMalloc(&d_slen, XSIZE*YSIZE);
int32_t *d_soffsets = NULL;
hipMalloc(&d_soffsets, XSIZE*YSIZE);
int32_t *d_params = NULL;
hipMalloc(&d_params, XSIZE*YSIZE);
int32_t *d_tmp_windows = NULL;
hipMalloc(&d_tmp_windows, XSIZE*YSIZE);
int32_t *d_tmp_windows_offsets = NULL;
hipMalloc(&d_tmp_windows_offsets, XSIZE*YSIZE);
int32_t *d_2d_cost_matrix = NULL;
hipMalloc(&d_2d_cost_matrix, XSIZE*YSIZE);
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
wlcss_cuda_kernel<<<gridBlock, threadBlock>>>(d_mss,d_mss_offsets,d_ts,d_ss,d_tlen,d_toffsets,d_slen,d_soffsets,d_params,d_tmp_windows,d_tmp_windows_offsets,d_2d_cost_matrix);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
wlcss_cuda_kernel<<<gridBlock, threadBlock>>>(d_mss,d_mss_offsets,d_ts,d_ss,d_tlen,d_toffsets,d_slen,d_soffsets,d_params,d_tmp_windows,d_tmp_windows_offsets,d_2d_cost_matrix);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
wlcss_cuda_kernel<<<gridBlock, threadBlock>>>(d_mss,d_mss_offsets,d_ts,d_ss,d_tlen,d_toffsets,d_slen,d_soffsets,d_params,d_tmp_windows,d_tmp_windows_offsets,d_2d_cost_matrix);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}