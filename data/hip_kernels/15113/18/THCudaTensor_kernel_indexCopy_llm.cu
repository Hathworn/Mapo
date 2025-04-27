#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy(float *res, float *src, long *res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim) 
{
    // Calculate the flattened thread index
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    long flat_size = src_size / idx_size;

    // Check if the thread index is within bounds
    if (thread_idx >= flat_size) return;

    // Use shared memory for index access
    __shared__ float shared_index[blockDim.x];
    if (threadIdx.x < idx_size) {
        shared_index[threadIdx.x] = index[threadIdx.x];
    }
    __syncthreads();

    // Iterate over index size and perform operations
    for (int i = 0; i < idx_size; i++) { 
        // Initialize residuals
        int leftover = thread_idx;
        long coeff = 0;
        int targetIdx = i * size_dim;
        int resIdx = 0;
        
        // Iterate over dimensions
        for (int d = 0; d < res_nDim; d++) {
            if (d == dim) {
                resIdx += ((long)(shared_index[i]) - 1) * res_stride[d]; // Use shared index
            } else {
                long stride_d = (d < dim) ? res_stride[d] / size_dim : res_stride[d];
                coeff = leftover / stride_d;
                leftover -= coeff * stride_d;
                targetIdx += coeff * res_stride[d];
                resIdx += coeff * res_stride[d];
            }
        }
        // Perform copy
        res[resIdx] = src[targetIdx];
    }
}