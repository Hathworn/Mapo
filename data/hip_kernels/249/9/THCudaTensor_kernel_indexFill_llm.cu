#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_indexFill(float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val)
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size)
    {
        long coeff = 0;
        int srcIdx = 0;
        int leftover = thread_idx;

        for (int d = 0; d < src_nDim; d++)
        {
            if (d < dim)
            {
                // Optimize stride calculations by precomputing size_dim division
                long strideDiv = stride[d] / size_dim;
                coeff = leftover / strideDiv;
                leftover -= coeff * strideDiv;
                srcIdx += coeff * stride[d];
            }
            else if (d > dim)
            {
                coeff = leftover / stride[d];
                leftover -= coeff * stride[d];
                srcIdx += coeff * stride[d];
            }
        }

        // Cache index calculation outside the loop
        int indexStride = (int)((index[thread_idx % idx_size]) - 1) * stride[dim];
        tensor[srcIdx + indexStride] = val;
    }
}