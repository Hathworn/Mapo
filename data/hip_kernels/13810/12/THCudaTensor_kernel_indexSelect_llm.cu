#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect(float *tensor, float *src, long *src_stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim) {
    // Calculate global thread index
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    // Total number of iterations required for the thread
    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size) {
        long coeff = 0;
        int leftover;
        int targetIdx;
        int srcIdx;

        // Iterate over the index size
        for (int i = 0; i < idx_size; i++) {
            leftover = thread_idx;
            targetIdx = 0;
            srcIdx = 0;

            // Loop over the dimensions
            for (int d = 0; d < src_nDim; d++) {
                // Efficiently compute stride contributions
                if (d < dim) {
                    long stride_d = src_stride[d] / size_dim;
                    coeff = leftover / stride_d;
                    leftover %= stride_d;  // Use modulo to avoid subtraction
                    targetIdx += coeff * stride_d * idx_size;
                    srcIdx += coeff * src_stride[d];
                } else if (d > dim) {
                    coeff = leftover / src_stride[d];
                    leftover %= src_stride[d];  // Use modulo to avoid subtraction
                    targetIdx += coeff * src_stride[d];
                    srcIdx += coeff * src_stride[d];
                }
            }
            // Efficiently map the source and target index using precomputed coeffs
            tensor[targetIdx + i * src_stride[dim]] = src[srcIdx + ((int)(index[i]) - 1) * src_stride[dim]];
        }
    }
}