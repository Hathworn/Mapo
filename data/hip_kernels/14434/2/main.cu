#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calculate_distances.cu"
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
    float *sweeper_pos_v = NULL;
hipMalloc(&sweeper_pos_v, XSIZE*YSIZE);
float *mine_pos_v = NULL;
hipMalloc(&mine_pos_v, XSIZE*YSIZE);
int num_sweepers = 1;
int num_mines = 1;
float *distance_v = NULL;
hipMalloc(&distance_v, XSIZE*YSIZE);
float *inputs = NULL;
hipMalloc(&inputs, XSIZE*YSIZE);
int *sweeper_score_v = NULL;
hipMalloc(&sweeper_score_v, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
int size = XSIZE*YSIZE;
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
calculate_distances<<<gridBlock, threadBlock>>>(sweeper_pos_v,mine_pos_v,num_sweepers,num_mines,distance_v,inputs,sweeper_score_v,width,height,size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calculate_distances<<<gridBlock, threadBlock>>>(sweeper_pos_v,mine_pos_v,num_sweepers,num_mines,distance_v,inputs,sweeper_score_v,width,height,size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calculate_distances<<<gridBlock, threadBlock>>>(sweeper_pos_v,mine_pos_v,num_sweepers,num_mines,distance_v,inputs,sweeper_score_v,width,height,size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}