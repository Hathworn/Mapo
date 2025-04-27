#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_index = blockIdx.x;
    idx += m * nsample * batch_index;
    grad_out += m * nsample * c * batch_index;
    grad_points += n * c * batch_index;

    int index = blockIdx.y * blockDim.x + threadIdx.x; // Compute unique thread index across blocks
    int stride = blockDim.x * gridDim.y; // Compute total stride considering multiple blocks

    for (int j = index; j < m * nsample; j += stride) { // Merged loops for better occupancy
        int j_m = j / nsample; // Compute original 'j' in 2D index
        int k = j % nsample;  // Compute original 'k' in 2D index
        int ii = idx[j];
        for (int l = 0; l < c; ++l) {
            atomicAdd(&grad_points[ii * c + l], grad_out[j * c + l]); // Use computed index directly
        }
    }
}