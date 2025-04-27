#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous(float *tensor, float *src, long stride, float *index, long idxSize)
{
    // Use shared memory to optimize memory access patterns for better performance
    extern __shared__ float sharedIndex[];

    const int VT = 4;
    const int WARP_SIZE = 32;

    // Load index data into shared memory (only if idxSize is small enough to benefit)
    if (threadIdx.x < idxSize) {
        sharedIndex[threadIdx.x] = index[threadIdx.x];
    }
    __syncthreads(); // Ensure all threads have loaded sharedIndex

    const int idx = blockIdx.x * blockDim.y + threadIdx.y;

    if (idx < idxSize) { // Ensure the index is valid
        for (int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE; startIdx < stride; startIdx += VT * WARP_SIZE)
        {
            const long srcIdx = ((long) sharedIndex[idx] - 1) * stride;
            const long targetIdx = idx * stride;

            #pragma unroll
            for (int i = 0; i < VT; i++) {
                const int featureIdx = startIdx + i * WARP_SIZE;
                if (featureIdx < stride) {
                    tensor[targetIdx + featureIdx] = src[srcIdx + featureIdx];
                }
            }
        }
    }
}