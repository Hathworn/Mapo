```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateExCovX(double *e_x_cov_x, double gauss_d2, int valid_voxel_num)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Parallelize using loop unrolling for efficiency
    for (int i = id; i < valid_voxel_num; i += stride * 4) {
        e_x_cov_x[i] *= gauss_d2;
        if (i + stride < valid_voxel_num)
            e_x_cov_x[i + stride] *= gauss_d2;
        if (i + stride * 2 < valid_voxel_num)
            e_x_cov_x[i + stride * 2] *= gauss_d2;
        if (i + stride * 3 < valid_voxel_num)
            e_x_cov_x[i + stride * 3] *= gauss_d2;
    }
}