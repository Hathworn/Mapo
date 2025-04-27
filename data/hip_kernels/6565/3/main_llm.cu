#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calcMaxPoolForwardGPU_llm.cu"
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
    float *in = NULL;
hipMalloc(&in, XSIZE*YSIZE);
float *out = NULL;
hipMalloc(&out, XSIZE*YSIZE);
int in_size_x = XSIZE*YSIZE;
int in_size_y = XSIZE*YSIZE;
int in_size_z = XSIZE*YSIZE;
int batch_size = XSIZE*YSIZE;
int out_size_x = XSIZE*YSIZE;
int out_size_y = XSIZE*YSIZE;
int out_size_z = XSIZE*YSIZE;
int stride = 2;
int kernel_size = XSIZE*YSIZE;
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
calcMaxPoolForwardGPU<<<gridBlock, threadBlock>>>(in,out,in_size_x,in_size_y,in_size_z,batch_size,out_size_x,out_size_y,out_size_z,stride,kernel_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calcMaxPoolForwardGPU<<<gridBlock, threadBlock>>>(in,out,in_size_x,in_size_y,in_size_z,batch_size,out_size_x,out_size_y,out_size_z,stride,kernel_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calcMaxPoolForwardGPU<<<gridBlock, threadBlock>>>(in,out,in_size_x,in_size_y,in_size_z,batch_size,out_size_x,out_size_y,out_size_z,stride,kernel_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}