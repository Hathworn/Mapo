#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computeCovDxdPi_llm.cu"
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
    int *valid_points = NULL;
hipMalloc(&valid_points, XSIZE*YSIZE);
int *starting_voxel_id = NULL;
hipMalloc(&starting_voxel_id, XSIZE*YSIZE);
int *voxel_id = NULL;
hipMalloc(&voxel_id, XSIZE*YSIZE);
int valid_points_num = 1;
double *inverse_covariance = NULL;
hipMalloc(&inverse_covariance, XSIZE*YSIZE);
int voxel_num = 1;
double gauss_d1 = 1;
double gauss_d2 = 1;
double *point_gradients = NULL;
hipMalloc(&point_gradients, XSIZE*YSIZE);
double *cov_dxd_pi = NULL;
hipMalloc(&cov_dxd_pi, XSIZE*YSIZE);
int valid_voxel_num = 1;
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
computeCovDxdPi<<<gridBlock, threadBlock>>>(valid_points,starting_voxel_id,voxel_id,valid_points_num,inverse_covariance,voxel_num,gauss_d1,gauss_d2,point_gradients,cov_dxd_pi,valid_voxel_num);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computeCovDxdPi<<<gridBlock, threadBlock>>>(valid_points,starting_voxel_id,voxel_id,valid_points_num,inverse_covariance,voxel_num,gauss_d1,gauss_d2,point_gradients,cov_dxd_pi,valid_voxel_num);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computeCovDxdPi<<<gridBlock, threadBlock>>>(valid_points,starting_voxel_id,voxel_id,valid_points_num,inverse_covariance,voxel_num,gauss_d1,gauss_d2,point_gradients,cov_dxd_pi,valid_voxel_num);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}