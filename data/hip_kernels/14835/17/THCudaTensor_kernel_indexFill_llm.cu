#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexFill(float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val)
{
    // Calculate a unique index for each thread
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    // Calculate total number of elements each thread will process
    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size)
    {
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int srcIdx = 0;
            // Combine the loops by removing redundant coefficient calculation
            for (int d = 0; d < src_nDim; d++)
            {
                if (d != dim)
                {
                    long divisor = (d < dim) ? (stride[d] / size_dim) : stride[d];
                    long coeff = leftover / divisor;
                    leftover -= coeff * divisor;
                    srcIdx += coeff * stride[d];
                }
            }
            // Update the tensor at calculated index
            tensor[srcIdx + (int)((index[i]) - 1) * stride[dim]] = val;
        }
    }
}