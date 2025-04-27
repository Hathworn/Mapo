#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "find_closest_mine.cu"
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
    float *mine_pos_v = NULL;
hipMalloc(&mine_pos_v, XSIZE*YSIZE);
float *distances_v = NULL;
hipMalloc(&distances_v, XSIZE*YSIZE);
int *mineIdx_v = NULL;
hipMalloc(&mineIdx_v, XSIZE*YSIZE);
int num_sweeprs = 1;
int num_mines = 1;
float *inputs = NULL;
hipMalloc(&inputs, XSIZE*YSIZE);
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
find_closest_mine<<<gridBlock, threadBlock>>>(mine_pos_v,distances_v,mineIdx_v,num_sweeprs,num_mines,inputs);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
find_closest_mine<<<gridBlock, threadBlock>>>(mine_pos_v,distances_v,mineIdx_v,num_sweeprs,num_mines,inputs);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
find_closest_mine<<<gridBlock, threadBlock>>>(mine_pos_v,distances_v,mineIdx_v,num_sweeprs,num_mines,inputs);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}