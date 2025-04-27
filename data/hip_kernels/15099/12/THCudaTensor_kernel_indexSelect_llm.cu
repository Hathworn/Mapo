#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect(float *tensor, float *src, long* src_stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim)
{
    // Improve thread index calculation for better mapping across blocks and threads
    int thread_idx = blockIdx.x * blockDim.x + threadIdx.x;

    long flat_size = tensor_size / idx_size;

    if (thread_idx < flat_size)
    {
        long coeff, leftover;
        int targetIdx, srcIdx, stride_d;

        for (int i = 0; i < idx_size; i++)
        {
            leftover = thread_idx;
            targetIdx = 0;
            srcIdx = 0;

            // Use loop unrolling for efficiency and access each dimension
            for (int d = 0; d < dim; d++)
            {
                stride_d = src_stride[d] / size_dim;
                coeff = leftover / stride_d;
                leftover -= coeff * stride_d;
                targetIdx += coeff * stride_d * idx_size;
                srcIdx += coeff * src_stride[d];
            }

            for (int d = dim + 1; d < src_nDim; d++)
            {
                coeff = leftover / src_stride[d];
                leftover -= coeff * src_stride[d];
                targetIdx += coeff * src_stride[d];
                srcIdx += coeff * src_stride[d];
            }

            // Minimize the index calculation to only once in loop iteration
            int index_val = (int)(index[i]) - 1;
            tensor[targetIdx + i * src_stride[dim]] = src[srcIdx + index_val * src_stride[dim]];
        }
    }
}