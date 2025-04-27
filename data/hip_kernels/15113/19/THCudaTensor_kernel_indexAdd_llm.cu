#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_indexAdd(float *res, float *src, long* res_stride, float *index, long res_nDim, int dim, long idx_size, long src_size, long size_dim)
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    long flat_size = src_size / idx_size;

    // Ensure the thread_id is within bounds to prevent unnecessary execution.
    if (thread_idx < flat_size)
    {
        // Use shared memory to store res_stride which are used multiple times.
        extern __shared__ long shared_stride[];
        if (threadIdx.x < res_nDim)
        {
            shared_stride[threadIdx.x] = res_stride[threadIdx.x];
        }
        __syncthreads();

        long coeff = 0;
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int targetIdx = 0;
            int resIdx = 0;
            int stride_d_updated = shared_stride[dim] / size_dim;

            for (int d = 0; d < res_nDim; d++)
            {
                if (d < dim)
                {
                    long stride_d = stride_d_updated;
                    coeff = leftover / stride_d;
                    leftover -= coeff * stride_d;
                    targetIdx += coeff * stride_d * idx_size;
                    resIdx += coeff * shared_stride[d];
                }
                else if (d > dim)
                {
                    coeff = leftover / shared_stride[d];
                    leftover -= coeff * shared_stride[d];
                    targetIdx += coeff * shared_stride[d];
                    resIdx += coeff * shared_stride[d];
                }
            }
            // Use a local variable to hold the atomic addition result
            float src_value = src[targetIdx + i * shared_stride[dim]];
            atomicAdd(&res[resIdx + ((long)(index[i]) - 1) * shared_stride[dim]], src_value);
        }
    }
}