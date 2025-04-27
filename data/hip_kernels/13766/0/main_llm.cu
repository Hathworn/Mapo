#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "vertical_conv_llm.cu"
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
    pixel *Pixel_in_v = NULL;
hipMalloc(&Pixel_in_v, XSIZE*YSIZE);
pixel *Pixel_out_v = NULL;
hipMalloc(&Pixel_out_v, XSIZE*YSIZE);
int img_wd_v = 1;
int img_ht_v = 1;
float *kernel_v = NULL;
hipMalloc(&kernel_v, XSIZE*YSIZE);
int k_v = 1;
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
vertical_conv<<<gridBlock, threadBlock>>>(Pixel_in_v,Pixel_out_v,img_wd_v,img_ht_v,kernel_v,k_v);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
vertical_conv<<<gridBlock, threadBlock>>>(Pixel_in_v,Pixel_out_v,img_wd_v,img_ht_v,kernel_v,k_v);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
vertical_conv<<<gridBlock, threadBlock>>>(Pixel_in_v,Pixel_out_v,img_wd_v,img_ht_v,kernel_v,k_v);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}