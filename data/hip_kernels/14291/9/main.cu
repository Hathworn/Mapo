#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "remove_redness_from_coordinates.cu"
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
    const unsigned int *d_coordinates = NULL;
hipMalloc(&d_coordinates, XSIZE*YSIZE);
unsigned char *d_r = NULL;
hipMalloc(&d_r, XSIZE*YSIZE);
unsigned char *d_b = NULL;
hipMalloc(&d_b, XSIZE*YSIZE);
unsigned char *d_g = NULL;
hipMalloc(&d_g, XSIZE*YSIZE);
unsigned char *d_r_output = NULL;
hipMalloc(&d_r_output, XSIZE*YSIZE);
int num_coordinates = 1;
int num_pixels_y = 1;
int num_pixels_x = 1;
int template_half_height = YSIZE;
int template_half_width = XSIZE;
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
remove_redness_from_coordinates<<<gridBlock, threadBlock>>>(d_coordinates,d_r,d_b,d_g,d_r_output,num_coordinates,num_pixels_y,num_pixels_x,template_half_height,template_half_width);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
remove_redness_from_coordinates<<<gridBlock, threadBlock>>>(d_coordinates,d_r,d_b,d_g,d_r_output,num_coordinates,num_pixels_y,num_pixels_x,template_half_height,template_half_width);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
remove_redness_from_coordinates<<<gridBlock, threadBlock>>>(d_coordinates,d_r,d_b,d_g,d_r_output,num_coordinates,num_pixels_y,num_pixels_x,template_half_height,template_half_width);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}