#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateExCovX(double *e_x_cov_x, double gauss_d2, int valid_voxel_num)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Using a linear grid-stride loop for better optimization across threads and blocks
    for (; id < valid_voxel_num; id += blockDim.x * gridDim.x) {
        e_x_cov_x[id] *= gauss_d2;  // Perform operation on each valid voxel
    }
}