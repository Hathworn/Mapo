#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kExtractPatches3.cu"
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
    float *images = NULL;
hipMalloc(&images, XSIZE*YSIZE);
float *patches = NULL;
hipMalloc(&patches, XSIZE*YSIZE);
float *width_offset = NULL;
hipMalloc(&width_offset, XSIZE*YSIZE);
float *height_offset = NULL;
hipMalloc(&height_offset, XSIZE*YSIZE);
float *flip = NULL;
hipMalloc(&flip, XSIZE*YSIZE);
int num_images = 1;
int img_width = XSIZE;
int img_height = YSIZE;
int patch_width = XSIZE;
int patch_height = YSIZE;
int num_colors = 1;
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
kExtractPatches3<<<gridBlock, threadBlock>>>(images,patches,width_offset,height_offset,flip,num_images,img_width,img_height,patch_width,patch_height,num_colors);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kExtractPatches3<<<gridBlock, threadBlock>>>(images,patches,width_offset,height_offset,flip,num_images,img_width,img_height,patch_width,patch_height,num_colors);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kExtractPatches3<<<gridBlock, threadBlock>>>(images,patches,width_offset,height_offset,flip,num_images,img_width,img_height,patch_width,patch_height,num_colors);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}