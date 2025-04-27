```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy(float *res, float *src, long* res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim)
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    long flat_size = src_size / idx_size;

    if (thread_idx < flat_size)
    {
        // Precompute multipliers to optimize targetIdx and resIdx calculation
        long coeff, leftover, stride_d;
        int targetIdx, resIdx;

        for (int i = 0; i < idx_size; i++)
        {
            leftover = thread_idx;
            targetIdx = 0;
            resIdx = 0;

            for (int d = 0; d < res_nDim; d++)
            {
                stride_d = (d < dim) ? (res_stride[d] / size_dim) : res_stride[d];
                coeff = leftover / stride_d;
                leftover -= coeff * stride_d;

                if (d != dim)
                {
                    targetIdx += coeff * stride_d * ((d < dim) ? idx_size : 1);
                    resIdx += coeff * res_stride[d];
                }
            }
            res[resIdx + ((int)(index[i]) - 1) * res_stride[dim]] = src[targetIdx + i * res_stride[dim]];
        }
    }
}