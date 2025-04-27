#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "add_kernel.cu"
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
    float4 __restrict *output_buf = NULL;
hipMalloc(&output_buf, XSIZE*YSIZE);
const float4 __restrict *input_buf1 = NULL;
hipMalloc(&input_buf1, XSIZE*YSIZE);
const float4 __restrict *input_buf2 = NULL;
hipMalloc(&input_buf2, XSIZE*YSIZE);
float alpha1 = 2;
float alpha2 = 2;
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
add_kernel<<<gridBlock, threadBlock>>>(output_buf,input_buf1,input_buf2,alpha1,alpha2,elem_count);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
add_kernel<<<gridBlock, threadBlock>>>(output_buf,input_buf1,input_buf2,alpha1,alpha2,elem_count);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
add_kernel<<<gridBlock, threadBlock>>>(output_buf,input_buf1,input_buf2,alpha1,alpha2,elem_count);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}