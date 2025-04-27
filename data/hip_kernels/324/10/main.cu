#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kContract.cu"
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
    float *expanded_data = NULL;
hipMalloc(&expanded_data, XSIZE*YSIZE);
float *targets = NULL;
hipMalloc(&targets, XSIZE*YSIZE);
int num_images = 1;
int num_input_channels = 1;
int image_size_y = XSIZE*YSIZE;
int image_size_x = XSIZE*YSIZE;
int num_modules_y = 1;
int num_modules_x = 1;
int kernel_size_y = XSIZE*YSIZE;
int kernel_size_x = XSIZE*YSIZE;
int padding_y = 1;
int padding_x = 1;
int stride_y = 2;
int stride_x = 2;
int num_modules_batch = 2;
int module_id_offset = 1;
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
kContract<<<gridBlock, threadBlock>>>(expanded_data,targets,num_images,num_input_channels,image_size_y,image_size_x,num_modules_y,num_modules_x,kernel_size_y,kernel_size_x,padding_y,padding_x,stride_y,stride_x,num_modules_batch,module_id_offset);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kContract<<<gridBlock, threadBlock>>>(expanded_data,targets,num_images,num_input_channels,image_size_y,image_size_x,num_modules_y,num_modules_x,kernel_size_y,kernel_size_x,padding_y,padding_x,stride_y,stride_x,num_modules_batch,module_id_offset);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kContract<<<gridBlock, threadBlock>>>(expanded_data,targets,num_images,num_input_channels,image_size_y,image_size_x,num_modules_y,num_modules_x,kernel_size_y,kernel_size_x,padding_y,padding_x,stride_y,stride_x,num_modules_batch,module_id_offset);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}