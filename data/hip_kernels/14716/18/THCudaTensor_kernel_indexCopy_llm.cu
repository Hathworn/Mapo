#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy( float *res, float *src, long* res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim )
{
    // Compute global thread index
    int thread_idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute flat size outside the loop
    long flat_size = src_size / idx_size;

    // Use direct return for threads out of range
    if (thread_idx >= flat_size) return;

    long coeff = 0;
    for (int i = 0; i < idx_size; i++)
    {
        int leftover = thread_idx;
        int targetIdx = 0;
        int resIdx = 0;

        for (int d = 0; d < res_nDim; d++)
        {
            // Simplified stride calculation by removing redundant operations and using conditional operations outside loop
            if (d < dim)
            {
                long stride_d = res_stride[d] / size_dim;
                coeff = leftover / stride_d;
                leftover -= coeff * stride_d;
                targetIdx += coeff * stride_d * idx_size;
                resIdx += coeff * res_stride[d];
            }
            else if (d > dim)
            {
                coeff = leftover / res_stride[d];
                leftover -= coeff * res_stride[d];
                targetIdx += coeff * res_stride[d];
                resIdx += coeff * res_stride[d];
            }
        }
        // Write result with stride adjustment
        res[resIdx + ((long)(index[i]) - 1) * res_stride[dim]] = src[targetIdx + i * res_stride[dim]];
    }
}