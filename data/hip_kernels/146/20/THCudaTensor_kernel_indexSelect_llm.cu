#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect(float *tensor, float *src, long *src_stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim)
{
    int thread_idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation

    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size)
    {
        long coeff = 0;
        int d;
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            long targetIdx = 0;
            long srcIdx = 0;
            #pragma unroll // Use unroll to optimize the loop
            for (d = 0; d < src_nDim; d++)
            {
                if (d < dim)
                {
                    long stride_d = src_stride[d] / size_dim;
                    coeff = leftover / stride_d;
                    leftover -= coeff * stride_d;
                    targetIdx += coeff * stride_d * idx_size;
                    srcIdx += coeff * src_stride[d];
                }
                else if (d > dim)
                {
                    coeff = leftover / src_stride[d];
                    leftover -= coeff * src_stride[d];
                    targetIdx += coeff * src_stride[d];
                    srcIdx += coeff * src_stride[d];
                }
            }
            tensor[targetIdx + i * src_stride[dim]] = src[srcIdx + ((int)(index[i]) - 1) * src_stride[dim]];
        }
    }
}