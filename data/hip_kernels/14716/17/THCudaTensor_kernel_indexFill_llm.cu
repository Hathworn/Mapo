#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexFill( float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val )
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    long flat_size = tensor_size / idx_size;
    
    if (thread_idx < flat_size)
    {
        // Optimize coefficient calculation by reducing redundant computations
        long coeff[20];  // Assume a maximum of 20 dimensions, update if needed
        long leftover = thread_idx;
        int srcIdx = 0;

        for (int d = 0; d < src_nDim; d++)
        {
            if (d < dim)
            {
                coeff[d] = leftover / (stride[d] / size_dim);
                leftover -= coeff[d] * (stride[d] / size_dim);
            }
            else if (d > dim)
            {
                coeff[d] = leftover / stride[d];
                leftover -= coeff[d] * stride[d];
            }
            else
            {
                coeff[d] = 0; // No need for calculation at dim index
            }
            srcIdx += coeff[d] * stride[d];
        }
        
        // Move index calculation outside of loop over i, as it remains constant
        long stride_dim_val = stride[dim];
        for (int i = 0; i < idx_size; i++)
        {
            tensor[srcIdx + (long)((index[i])-1) * stride_dim_val] = val;
        }
    }
}