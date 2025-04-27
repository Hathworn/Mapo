#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexCopy( float *res, float *src, long* res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim )
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    long flat_size = src_size / idx_size;

    // Use shared memory to store res_stride for faster access
    extern __shared__ long shared_res_stride[];
    if (threadIdx.x < res_nDim) {
        shared_res_stride[threadIdx.x] = res_stride[threadIdx.x];
    }
    __syncthreads();

    if (thread_idx < flat_size)
    {
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int targetIdx = 0;
            int resIdx = 0;
            for (int d = 0; d < res_nDim; d++)
            {
                long stride_d = (d == dim) ? size_dim : shared_res_stride[d];
                long coeff = leftover / stride_d;
                leftover -= coeff * stride_d;
                if (d < dim)
                {
                    targetIdx += coeff * stride_d * idx_size;
                    resIdx += coeff * shared_res_stride[d];
                }
                else if (d > dim)
                {
                    targetIdx += coeff * shared_res_stride[d];
                    resIdx += coeff * shared_res_stride[d];
                }
            }
            long idx_offset = ((long)(index[i]) - 1) * shared_res_stride[dim];
            res[resIdx + idx_offset] = src[targetIdx + i * shared_res_stride[dim]];
        }
    }
}