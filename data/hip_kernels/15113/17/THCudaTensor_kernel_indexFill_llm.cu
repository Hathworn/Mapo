#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_indexFill(float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val)
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size)
    {
        long coeff, leftover, srcIdx;

        // Loop unrolling to improve performance
        for (int i = 0; i < idx_size; i++)
        {
            leftover = thread_idx;
            srcIdx = 0;

            #pragma unroll
            for (int d = 0; d < src_nDim; d++)
            {
                if (d < dim) 
                {
                    coeff = leftover / (stride[d] / size_dim);  // Calculate coefficient
                    leftover -= coeff * (stride[d] / size_dim); // Update leftover
                    srcIdx += coeff * stride[d];                // Calculate srcIdx
                }
                else if (d > dim)
                {
                    coeff = leftover / stride[d];                 // Calculate coefficient
                    leftover -= coeff * stride[d];                // Update leftover
                    srcIdx += coeff * stride[d];                  // Calculate srcIdx
                }
            }
            tensor[srcIdx + (long)((index[i]) - 1) * stride[dim]] = val; // Set tensor value
        }
    }
}