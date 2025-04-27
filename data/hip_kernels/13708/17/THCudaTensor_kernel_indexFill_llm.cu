#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexFill(float *tensor, long *stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val) 
{
    int thread_idx = blockIdx.x * blockDim.x + threadIdx.x;

    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size) 
    {
        long leftover = thread_idx;
        long srcIdx = 0;

        // Compute source index based on flat index
        for (int d = 0; d < src_nDim; d++) 
        {
            long coeff;
            if (d < dim) 
            {
                coeff = leftover / (stride[d] / size_dim);
                leftover -= coeff * (stride[d] / size_dim);
            } 
            else if (d > dim) 
            {
                coeff = leftover / stride[d];
                leftover -= coeff * stride[d];
            }
            srcIdx += coeff * stride[d];
        }

        // Update tensor value for each index in idx_size
        for (int i = 0; i < idx_size; i++) 
        {
            long idx = static_cast<long>(index[i]) - 1;
            tensor[srcIdx + idx * stride[dim]] = val;
        }
    }
}