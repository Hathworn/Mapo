#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calcDetectObjectsBackwardGPU_llm.cu"
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
    float *dz_in = NULL;
hipMalloc(&dz_in, XSIZE*YSIZE);
float *dz = NULL;
hipMalloc(&dz, XSIZE*YSIZE);
float *in = NULL;
hipMalloc(&in, XSIZE*YSIZE);
int batch_size = XSIZE*YSIZE;
int in_size_x = XSIZE*YSIZE;
int in_size_y = XSIZE*YSIZE;
int in_size_z = XSIZE*YSIZE;
int max_bounding_boxes = 1;
int max_classes = 1;
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
calcDetectObjectsBackwardGPU<<<gridBlock, threadBlock>>>(dz_in,dz,in,batch_size,in_size_x,in_size_y,in_size_z,max_bounding_boxes,max_classes);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calcDetectObjectsBackwardGPU<<<gridBlock, threadBlock>>>(dz_in,dz,in,batch_size,in_size_x,in_size_y,in_size_z,max_bounding_boxes,max_classes);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calcDetectObjectsBackwardGPU<<<gridBlock, threadBlock>>>(dz_in,dz,in,batch_size,in_size_x,in_size_y,in_size_z,max_bounding_boxes,max_classes);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}