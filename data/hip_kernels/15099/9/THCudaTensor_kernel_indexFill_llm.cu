#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_indexFill(float *tensor, long* stride, float *index, long src_nDim, int dim, long idx_size, long tensor_size, long size_dim, float val)
{
    int thread_idx = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;

    long flat_size = tensor_size / idx_size;

    // Utilize shared memory for frequently accessed data to reduce global memory accesses
    __shared__ long sharedStride[16];  // Adjust size according to src_nDim if larger
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int d = 0; d < src_nDim; d++) {
            sharedStride[d] = stride[d];
        }
    }
    __syncthreads();

    if (thread_idx < flat_size)
    {
        long coeff = 0;
        for (int i = 0; i < idx_size; i++)
        {
            int leftover = thread_idx;
            int srcIdx = 0;
            for (int d = 0; d < src_nDim; d++)
            {
                // Simplified redundant condition checks
                coeff = leftover / (d == dim ? size_dim : sharedStride[d] / size_dim);
                leftover -= coeff * (d == dim ? size_dim : sharedStride[d] / size_dim);
                srcIdx += coeff * sharedStride[d];
            }
            tensor[srcIdx + (int)((index[i]) - 1) * sharedStride[dim]] = val;
        }
    }
}