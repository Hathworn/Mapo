#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateExCovX(double *e_x_cov_x, double gauss_d2, int valid_voxel_num)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Process each element in the range of this thread
    for (int i = id; i < valid_voxel_num; i += stride) {
        e_x_cov_x[i] *= gauss_d2;
    }
}