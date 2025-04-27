#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "operate_on_block_one_gpu_llm.cu"
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
    int i = 1;
int *d_array = NULL;
hipMalloc(&d_array, XSIZE*YSIZE);
int x_start = 1;
int y_start = 1;
char *d_subsequence1 = NULL;
hipMalloc(&d_subsequence1, XSIZE*YSIZE);
char *d_subsequence2 = NULL;
hipMalloc(&d_subsequence2, XSIZE*YSIZE);
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
operate_on_block_one_gpu<<<gridBlock, threadBlock>>>(i,d_array,x_start,y_start,d_subsequence1,d_subsequence2);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
operate_on_block_one_gpu<<<gridBlock, threadBlock>>>(i,d_array,x_start,y_start,d_subsequence1,d_subsequence2);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
operate_on_block_one_gpu<<<gridBlock, threadBlock>>>(i,d_array,x_start,y_start,d_subsequence1,d_subsequence2);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}