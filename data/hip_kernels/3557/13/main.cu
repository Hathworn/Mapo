#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "add_weighted_kernel.cu"
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
    unsigned int batchSize = 1;
unsigned int nbOutputs = 1;
unsigned int outputsHeight = 1;
unsigned int outputsWidth = 1;
float *estimated_labels = NULL;
hipMalloc(&estimated_labels, XSIZE*YSIZE);
unsigned int nbChannels = 1;
unsigned int image_height = 1;
unsigned int image_width = 1;
float *input_image = NULL;
hipMalloc(&input_image, XSIZE*YSIZE);
unsigned char *workspace = NULL;
hipMalloc(&workspace, XSIZE*YSIZE);
float alpha = 2;
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
add_weighted_kernel<<<gridBlock, threadBlock>>>(batchSize,nbOutputs,outputsHeight,outputsWidth,estimated_labels,nbChannels,image_height,image_width,input_image,workspace,alpha);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
add_weighted_kernel<<<gridBlock, threadBlock>>>(batchSize,nbOutputs,outputsHeight,outputsWidth,estimated_labels,nbChannels,image_height,image_width,input_image,workspace,alpha);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
add_weighted_kernel<<<gridBlock, threadBlock>>>(batchSize,nbOutputs,outputsHeight,outputsWidth,estimated_labels,nbChannels,image_height,image_width,input_image,workspace,alpha);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}