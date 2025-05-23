#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy(float *res, float *src, long* res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim)
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    long flat_size = src_size / idx_size;

    if (thread_idx < flat_size) {
        long coeff = 0;
        int targetIdx = 0;
        int resIdx = 0;
        int leftover = thread_idx; // Precompute leftover index only once

        for (int d = 0; d < res_nDim; d++) {
            if (d < dim || d > dim) {
                long stride_d = (d < dim) ? res_stride[d] / size_dim : res_stride[d];
                coeff = leftover / stride_d;
                leftover -= coeff * stride_d;
                targetIdx += coeff * res_stride[d];
                resIdx += coeff * res_stride[d];
            }
        }

        // Combine targetIdx and index calculations outside loops when possible
        for (int i = 0; i < idx_size; i++) {
            res[resIdx + ((int)(index[i]) - 1) * res_stride[dim]] = src[targetIdx + i * res_stride[dim]];
        }
    }
}