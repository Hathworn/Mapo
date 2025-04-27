```
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy( float *res, float *src, long* res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim )
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    // Calculate the flat size outside the loop
    long flat_size = src_size / idx_size;

    if (thread_idx < flat_size)
    {
        long targetIdxBase = 0;
        long resIdxBase = 0;
        int leftover = thread_idx;

        for (int d = 0; d < res_nDim; ++d)
        {
            if (d != dim)
            {
                long stride_d = (d < dim) ? (res_stride[d] / size_dim) : res_stride[d];
                long coeff = leftover / stride_d;
                leftover -= coeff * stride_d;
                targetIdxBase += coeff * stride_d * ((d < dim) ? idx_size : 1);
                resIdxBase += coeff * res_stride[d];
            }
        }

        // Use index out of the loop, reducing redundant computations
        for (int i = 0; i < idx_size; ++i)
        {
            long targetIdx = targetIdxBase + i * res_stride[dim];
            long indexOffset = ((long)(index[i]) - 1) * res_stride[dim];
            res[resIdxBase + indexOffset] = src[targetIdx];
        }
    }
}