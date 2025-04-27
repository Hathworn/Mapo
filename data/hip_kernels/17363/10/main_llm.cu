#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_push_atomic2_llm.cu"
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
    int *g_terminate = NULL;
hipMalloc(&g_terminate, XSIZE*YSIZE);
int *g_push_reser = NULL;
hipMalloc(&g_push_reser, XSIZE*YSIZE);
int *s_push_reser = NULL;
hipMalloc(&s_push_reser, XSIZE*YSIZE);
int *g_block_num = NULL;
hipMalloc(&g_block_num, XSIZE*YSIZE);
int width1 = XSIZE;
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
kernel_push_atomic2<<<gridBlock, threadBlock>>>(g_terminate,g_push_reser,s_push_reser,g_block_num,width1);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_push_atomic2<<<gridBlock, threadBlock>>>(g_terminate,g_push_reser,s_push_reser,g_block_num,width1);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_push_atomic2<<<gridBlock, threadBlock>>>(g_terminate,g_push_reser,s_push_reser,g_block_num,width1);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}