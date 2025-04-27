#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy(float *res, float *src, long *res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim)
{
    // Use a more efficient calculation for thread index
    int thread_idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the flat size outside the loop to reduce redundant operations
    long flat_size = src_size / idx_size;

    // Check if the thread index is within bounds
    if (thread_idx < flat_size)
    {
        // Precompute some common values outside of the loop
        int stride_dim = res_stride[dim];
        long target_incr = idx_size * stride_dim;

        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int targetIdx = 0;
            int resIdx = 0;

            for (int d = 0; d < res_nDim; d++)
            {
                if (d < dim)
                {
                    long stride_d = res_stride[d] / size_dim;
                    int coeff = leftover / stride_d;
                    leftover -= coeff * stride_d;
                    targetIdx += coeff * stride_d * idx_size;
                    resIdx += coeff * res_stride[d];
                }
                else if (d > dim)
                {
                    int coeff = leftover / res_stride[d];
                    leftover -= coeff * res_stride[d];
                    targetIdx += coeff * res_stride[d];
                    resIdx += coeff * res_stride[d];
                }
            }
            int index_val = static_cast<int>(index[i]) - 1;
            res[resIdx + index_val * stride_dim] = src[targetIdx + i * stride_dim];
        }
    }
}