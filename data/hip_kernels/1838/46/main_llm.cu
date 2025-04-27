#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "convert2DVectorToAngleMagnitude_kernel_llm.cu"
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
    uchar4 *d_angle_image = NULL;
hipMalloc(&d_angle_image, XSIZE*YSIZE);
uchar4 *d_magnitude_image = NULL;
hipMalloc(&d_magnitude_image, XSIZE*YSIZE);
float *d_vector_X = NULL;
hipMalloc(&d_vector_X, XSIZE*YSIZE);
float *d_vector_Y = NULL;
hipMalloc(&d_vector_Y, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
float lower_ang = 1;
float upper_ang = 1;
float lower_mag = 1;
float upper_mag = 1;
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
convert2DVectorToAngleMagnitude_kernel<<<gridBlock, threadBlock>>>(d_angle_image,d_magnitude_image,d_vector_X,d_vector_Y,width,height,lower_ang,upper_ang,lower_mag,upper_mag);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
convert2DVectorToAngleMagnitude_kernel<<<gridBlock, threadBlock>>>(d_angle_image,d_magnitude_image,d_vector_X,d_vector_Y,width,height,lower_ang,upper_ang,lower_mag,upper_mag);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
convert2DVectorToAngleMagnitude_kernel<<<gridBlock, threadBlock>>>(d_angle_image,d_magnitude_image,d_vector_X,d_vector_Y,width,height,lower_ang,upper_ang,lower_mag,upper_mag);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}