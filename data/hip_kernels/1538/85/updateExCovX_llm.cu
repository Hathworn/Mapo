#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateExCovX(double *e_x_cov_x, double gauss_d2, int valid_voxel_num)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Reducing number of operations with addition in loop condition
    while (id < valid_voxel_num) {
        e_x_cov_x[id] *= gauss_d2;
        id += stride;
    }
}