#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "check_collisions_llm.cu"
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
    float x1_robot = 1;
float y1_robot = 1;
float x2_robot = 1;
float y2_robot = 1;
float *x1_obs = NULL;
hipMalloc(&x1_obs, XSIZE*YSIZE);
float *y1_obs = NULL;
hipMalloc(&y1_obs, XSIZE*YSIZE);
float *x2_obs = NULL;
hipMalloc(&x2_obs, XSIZE*YSIZE);
float *y2_obs = NULL;
hipMalloc(&y2_obs, XSIZE*YSIZE);
bool *collisions = NULL;
hipMalloc(&collisions, XSIZE*YSIZE);
int *indexes = NULL;
hipMalloc(&indexes, XSIZE*YSIZE);
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
check_collisions<<<gridBlock, threadBlock>>>(x1_robot,y1_robot,x2_robot,y2_robot,x1_obs,y1_obs,x2_obs,y2_obs,collisions,indexes);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
check_collisions<<<gridBlock, threadBlock>>>(x1_robot,y1_robot,x2_robot,y2_robot,x1_obs,y1_obs,x2_obs,y2_obs,collisions,indexes);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
check_collisions<<<gridBlock, threadBlock>>>(x1_robot,y1_robot,x2_robot,y2_robot,x1_obs,y1_obs,x2_obs,y2_obs,collisions,indexes);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}