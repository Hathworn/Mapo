#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computeHessianListS2.cu"
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
    float *trans_x = NULL;
hipMalloc(&trans_x, XSIZE*YSIZE);
float *trans_y = NULL;
hipMalloc(&trans_y, XSIZE*YSIZE);
float *trans_z = NULL;
hipMalloc(&trans_z, XSIZE*YSIZE);
int *valid_points = NULL;
hipMalloc(&valid_points, XSIZE*YSIZE);
int *starting_voxel_id = NULL;
hipMalloc(&starting_voxel_id, XSIZE*YSIZE);
int *voxel_id = NULL;
hipMalloc(&voxel_id, XSIZE*YSIZE);
int valid_points_num = 1;
double *centroid_x = NULL;
hipMalloc(&centroid_x, XSIZE*YSIZE);
double *centroid_y = NULL;
hipMalloc(&centroid_y, XSIZE*YSIZE);
double *centroid_z = NULL;
hipMalloc(&centroid_z, XSIZE*YSIZE);
double gauss_d1 = 1;
double *e_x_cov_x = NULL;
hipMalloc(&e_x_cov_x, XSIZE*YSIZE);
double *icov00 = NULL;
hipMalloc(&icov00, XSIZE*YSIZE);
double *icov01 = NULL;
hipMalloc(&icov01, XSIZE*YSIZE);
double *icov02 = NULL;
hipMalloc(&icov02, XSIZE*YSIZE);
double *icov10 = NULL;
hipMalloc(&icov10, XSIZE*YSIZE);
double *icov11 = NULL;
hipMalloc(&icov11, XSIZE*YSIZE);
double *icov12 = NULL;
hipMalloc(&icov12, XSIZE*YSIZE);
double *icov20 = NULL;
hipMalloc(&icov20, XSIZE*YSIZE);
double *icov21 = NULL;
hipMalloc(&icov21, XSIZE*YSIZE);
double *icov22 = NULL;
hipMalloc(&icov22, XSIZE*YSIZE);
double *point_hessians = NULL;
hipMalloc(&point_hessians, XSIZE*YSIZE);
double *hessians = NULL;
hipMalloc(&hessians, XSIZE*YSIZE);
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
computeHessianListS2<<<gridBlock, threadBlock>>>(trans_x,trans_y,trans_z,valid_points,starting_voxel_id,voxel_id,valid_points_num,centroid_x,centroid_y,centroid_z,gauss_d1,e_x_cov_x,icov00,icov01,icov02,icov10,icov11,icov12,icov20,icov21,icov22,point_hessians,hessians,valid_voxel_num);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computeHessianListS2<<<gridBlock, threadBlock>>>(trans_x,trans_y,trans_z,valid_points,starting_voxel_id,voxel_id,valid_points_num,centroid_x,centroid_y,centroid_z,gauss_d1,e_x_cov_x,icov00,icov01,icov02,icov10,icov11,icov12,icov20,icov21,icov22,point_hessians,hessians,valid_voxel_num);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computeHessianListS2<<<gridBlock, threadBlock>>>(trans_x,trans_y,trans_z,valid_points,starting_voxel_id,voxel_id,valid_points_num,centroid_x,centroid_y,centroid_z,gauss_d1,e_x_cov_x,icov00,icov01,icov02,icov10,icov11,icov12,icov20,icov21,icov22,point_hessians,hessians,valid_voxel_num);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}