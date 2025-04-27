#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batchIdx = blockIdx.x;
    int threadIdx = threadIdx.x;
    
    // Calculate global index for each thread
    int globalThreadIdx = batchIdx * blockDim.x + threadIdx;
    
    // Adjust pointers for current batch
    grad_out += m * nsample * c * globalThreadIdx;
    idx += m * nsample * globalThreadIdx;
    grad_points += n * c * globalThreadIdx;

    // Iterate over each 'm' and 'nsample' for current batch
    for (int j = 0; j < m; ++j) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                // Efficient memory access
                atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]);
            }
        }
    }
}