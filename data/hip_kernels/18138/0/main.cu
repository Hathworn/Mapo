#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "mat_mul_gpu.cu"
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
    float *vec_one = NULL;
hipMalloc(&vec_one, XSIZE*YSIZE);
float *vec_two = NULL;
hipMalloc(&vec_two, XSIZE*YSIZE);
float *ret_vec = NULL;
hipMalloc(&ret_vec, XSIZE*YSIZE);
int vec_one_row = 1;
int vec_one_col = 1;
int vec_two_col = 1;
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
mat_mul_gpu<<<gridBlock, threadBlock>>>(vec_one,vec_two,ret_vec,vec_one_row,vec_one_col,vec_two_col);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
mat_mul_gpu<<<gridBlock, threadBlock>>>(vec_one,vec_two,ret_vec,vec_one_row,vec_one_col,vec_two_col);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
mat_mul_gpu<<<gridBlock, threadBlock>>>(vec_one,vec_two,ret_vec,vec_one_row,vec_one_col,vec_two_col);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}