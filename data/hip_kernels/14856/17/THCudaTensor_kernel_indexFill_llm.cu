#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexFill(float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val) {
    // Calculate thread index
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    // Calculate flat size
    long flat_size = tensor_size / idx_size;

    // Check if within bounds
    if (thread_idx < flat_size) {
        long coeff = 0;
        
        // Main loop for index filling
        for (int i = 0; i < idx_size; i++) {
            int leftover = thread_idx;
            int srcIdx = 0;

            // Calculate source index efficiently
            for (int d = 0; d < src_nDim; d++) {
                coeff = leftover / ((d != dim) ? stride[d] : (stride[d] / size_dim));
                leftover -= coeff * ((d != dim) ? stride[d] : (stride[d] / size_dim));
                srcIdx += coeff * stride[d];
            }

            // Update tensor value
            tensor[srcIdx + (long)((index[i]) - 1) * stride[dim]] = val;
        }
    }
}