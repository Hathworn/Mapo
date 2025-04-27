#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computeScoreList.cu"
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
    int *starting_voxel_id = NULL;
hipMalloc(&starting_voxel_id, XSIZE*YSIZE);
int *voxel_id = NULL;
hipMalloc(&voxel_id, XSIZE*YSIZE);
int valid_points_num = 1;
double *e_x_cov_x = NULL;
hipMalloc(&e_x_cov_x, XSIZE*YSIZE);
double gauss_d1 = 1;
double *score = NULL;
hipMalloc(&score, XSIZE*YSIZE);
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
computeScoreList<<<gridBlock, threadBlock>>>(starting_voxel_id,voxel_id,valid_points_num,e_x_cov_x,gauss_d1,score);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computeScoreList<<<gridBlock, threadBlock>>>(starting_voxel_id,voxel_id,valid_points_num,e_x_cov_x,gauss_d1,score);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computeScoreList<<<gridBlock, threadBlock>>>(starting_voxel_id,voxel_id,valid_points_num,e_x_cov_x,gauss_d1,score);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}