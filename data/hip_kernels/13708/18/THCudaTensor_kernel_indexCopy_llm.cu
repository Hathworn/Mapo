#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy(float *res, float *src, long* res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim)
{
    // Calculate thread index with simplified formula
    int thread_idx = blockIdx.x * blockDim.x + threadIdx.x;
    long flat_size = src_size / idx_size;

    if (thread_idx < flat_size)
    {
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int targetIdx = 0;
            int resIdx = 0;

            // Unroll innermost loop for performance optimization
            for (int d = 0; d < res_nDim; ++d)
            {
                if (d != dim)
                {
                    long stride_d = d < dim ? res_stride[d] / size_dim : res_stride[d];
                    long coeff = leftover / stride_d;
                    leftover -= coeff * stride_d;
                    long inc = coeff * res_stride[d];
                    targetIdx += inc; 
                    resIdx += inc;
                }
            }

            res[resIdx + ((int)(index[i]) - 1) * res_stride[dim]] = src[targetIdx + i * res_stride[dim]];
        }
    }
}