#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect(float *tensor, float *src, long* src_stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim)
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size)
    {
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int targetIdx = 0;
            int srcIdx = 0;

            // Use loop unrolling to reduce loop overhead
            long stride_d, coeff_d;
            for (int d = 0; d < dim; d++)
            {
                stride_d = src_stride[d] / size_dim;
                coeff_d = leftover / stride_d;
                leftover -= coeff_d * stride_d;
                targetIdx += coeff_d * stride_d * idx_size;
                srcIdx += coeff_d * src_stride[d];
            }
            for (int d = dim + 1; d < src_nDim; d++)
            {
                coeff_d = leftover / src_stride[d];
                leftover -= coeff_d * src_stride[d];
                targetIdx += coeff_d * src_stride[d];
                srcIdx += coeff_d * src_stride[d];
            }
            
            // Simplify index calculation
            int index_val = (int)(index[i]) - 1; 
            tensor[targetIdx + i * src_stride[dim]] = src[srcIdx + index_val * src_stride[dim]];
        }
    }
}