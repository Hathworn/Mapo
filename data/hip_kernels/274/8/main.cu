#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "naive_normalized_cross_correlation.cu"
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
    float *d_response = NULL;
hipMalloc(&d_response, XSIZE*YSIZE);
unsigned char *d_original = NULL;
hipMalloc(&d_original, XSIZE*YSIZE);
unsigned char *d_template = NULL;
hipMalloc(&d_template, XSIZE*YSIZE);
int num_pixels_y = 1;
int num_pixels_x = 1;
int template_half_height = YSIZE;
int template_height = YSIZE;
int template_half_width = XSIZE;
int template_width = XSIZE;
int template_size = XSIZE*YSIZE;
float template_mean = 1;
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
naive_normalized_cross_correlation<<<gridBlock, threadBlock>>>(d_response,d_original,d_template,num_pixels_y,num_pixels_x,template_half_height,template_height,template_half_width,template_width,template_size,template_mean);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
naive_normalized_cross_correlation<<<gridBlock, threadBlock>>>(d_response,d_original,d_template,num_pixels_y,num_pixels_x,template_half_height,template_height,template_half_width,template_width,template_size,template_mean);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
naive_normalized_cross_correlation<<<gridBlock, threadBlock>>>(d_response,d_original,d_template,num_pixels_y,num_pixels_x,template_half_height,template_height,template_half_width,template_width,template_size,template_mean);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}