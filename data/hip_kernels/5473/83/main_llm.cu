#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "computeScoreGradientList_llm.cu"
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
int voxel_num = 1;
double *e_x_cov_x = NULL;
hipMalloc(&e_x_cov_x, XSIZE*YSIZE);
double *cov_dxd_pi = NULL;
hipMalloc(&cov_dxd_pi, XSIZE*YSIZE);
double gauss_d1 = 1;
int valid_voxel_num = 1;
double *score_gradients = NULL;
hipMalloc(&score_gradients, XSIZE*YSIZE);
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
computeScoreGradientList<<<gridBlock, threadBlock>>>(trans_x,trans_y,trans_z,valid_points,starting_voxel_id,voxel_id,valid_points_num,centroid_x,centroid_y,centroid_z,voxel_num,e_x_cov_x,cov_dxd_pi,gauss_d1,valid_voxel_num,score_gradients);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
computeScoreGradientList<<<gridBlock, threadBlock>>>(trans_x,trans_y,trans_z,valid_points,starting_voxel_id,voxel_id,valid_points_num,centroid_x,centroid_y,centroid_z,voxel_num,e_x_cov_x,cov_dxd_pi,gauss_d1,valid_voxel_num,score_gradients);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
computeScoreGradientList<<<gridBlock, threadBlock>>>(trans_x,trans_y,trans_z,valid_points,starting_voxel_id,voxel_id,valid_points_num,centroid_x,centroid_y,centroid_z,voxel_num,e_x_cov_x,cov_dxd_pi,gauss_d1,valid_voxel_num,score_gradients);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}