#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexFill(float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val) {
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size) {
        long base_index = 0;
        int leftover = thread_idx;

        // Pre-calculate the base index for the current thread
        for (int d = 0; d < src_nDim; d++) {
            if (d != dim) {
                long stride_factor = (d < dim) ? stride[d] / size_dim : stride[d];
                long coeff = leftover / stride_factor;
                leftover -= coeff * stride_factor;
                base_index += coeff * stride[d];
            }
        }

        // Update tensor values using pre-computed base index
        for (int i = 0; i < idx_size; i++) {
            tensor[base_index + (int)(index[i] - 1) * stride[dim]] = val;
        }
    }
}