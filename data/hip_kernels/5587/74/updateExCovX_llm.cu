#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateExCovX(double *e_x_cov_x, double gauss_d2, int valid_voxel_num)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Unroll loop to reduce loop overhead
    for (int i = id; i < valid_voxel_num; i += stride * 4) {
        e_x_cov_x[i] *= gauss_d2;
        if (i + stride < valid_voxel_num) e_x_cov_x[i + stride] *= gauss_d2;
        if (i + 2 * stride < valid_voxel_num) e_x_cov_x[i + 2 * stride] *= gauss_d2;
        if (i + 3 * stride < valid_voxel_num) e_x_cov_x[i + 3 * stride] *= gauss_d2;
    }
}