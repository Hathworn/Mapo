#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_indexFill( float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val )
{
    // Calculate the global thread index using a typical 3D grid and block approach
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    long flat_size = tensor_size / idx_size;
    
    // Check if the thread index is within bounds
    if (thread_idx < flat_size)
    {
        // Precompute and store index multipliers to avoid repetitive calculation
        long idxStride = stride[dim];
        
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int srcIdx = 0;

            // Loop through dimensions and calculate the index in tensor
            for (int d = 0; d < src_nDim; d++)
            {
                long step = (d < dim) ? stride[d] / size_dim : stride[d];
                long coeff = leftover / step;
                leftover -= coeff * step;
                srcIdx += coeff * stride[d];
            }
            
            // Update tensor value for the calculated index
            tensor[srcIdx + (long)(index[i] - 1) * idxStride] = val;
        }
    }
}