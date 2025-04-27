#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "max_pooling_kernel.cu"
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
    float *feature_map = NULL;
hipMalloc(&feature_map, XSIZE*YSIZE);
float *probs = NULL;
hipMalloc(&probs, XSIZE*YSIZE);
float *target = NULL;
hipMalloc(&target, XSIZE*YSIZE);
int feature_map_size = XSIZE*YSIZE;
int feature_map_num = 1;
int pooling_rate = 1;
float *rnd_array = NULL;
hipMalloc(&rnd_array, XSIZE*YSIZE);
int rnd_num = 1;
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
max_pooling_kernel<<<gridBlock, threadBlock>>>(feature_map,probs,target,feature_map_size,feature_map_num,pooling_rate,rnd_array,rnd_num);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
max_pooling_kernel<<<gridBlock, threadBlock>>>(feature_map,probs,target,feature_map_size,feature_map_num,pooling_rate,rnd_array,rnd_num);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
max_pooling_kernel<<<gridBlock, threadBlock>>>(feature_map,probs,target,feature_map_size,feature_map_num,pooling_rate,rnd_array,rnd_num);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}