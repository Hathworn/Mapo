#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy(float *res, float *src, long* res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim)
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    long flat_size = src_size / idx_size;

    if (thread_idx < flat_size)
    {
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int targetIdx = 0;
            int resIdx = 0;
            
            #pragma unroll // Unroll the loop for better performance
            for (int d = 0; d < res_nDim; d++)
            {
                long coeff = 0; // Moved declaration here for better scope control
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
            // Combine index computation to minimize extraneous arithmetic
            int indexVal = static_cast<int>(index[i]) - 1;
            res[resIdx + indexVal * res_stride[dim]] = src[targetIdx + i * res_stride[dim]];
        }
    }
}