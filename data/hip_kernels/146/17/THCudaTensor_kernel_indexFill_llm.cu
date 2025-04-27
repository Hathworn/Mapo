#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexFill( float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val )
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size)
    {
        // Cache values used in loops
        long index_stride_dim = stride[dim];

        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int srcIdx = 0;
            // Combined loops for 'before' and 'after' dim
            for (int d = 0; d < src_nDim; d++)
            {
                // Avoid division when not necessary
                if (d == dim)
                {
                    continue;
                }
                coeff = leftover / stride[d];
                leftover -= coeff * stride[d];
                srcIdx += coeff * stride[d];
            }
            tensor[srcIdx + ((int)(index[i] - 1) * index_stride_dim)] = val;
        }
    }
}