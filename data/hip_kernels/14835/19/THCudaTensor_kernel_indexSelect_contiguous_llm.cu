#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous( float *tensor, float *src, long stride, float *index, long idxSize)
{
    // Use shared memory for improved memory access patterns
    extern __shared__ float sharedSrc[];

    const int VT = 4;
    const int WARP_SIZE = 32;
    const int MAX_DIM_SIZE = 65535;

    for (int idx = blockIdx.x * blockDim.y + threadIdx.y; idx < idxSize; idx += blockDim.y * MAX_DIM_SIZE) {
        
        // Load index in register
        const int idxInBlock = threadIdx.y;
        const int srcIdx = ((int)index[idx] - 1) * stride;
        const int targetIdx = idx * stride;

        // First warp loads data into shared memory
        if (threadIdx.x < WARP_SIZE) {
            for (int startIdx = threadIdx.x; startIdx < stride; startIdx += WARP_SIZE) {
                sharedSrc[startIdx] = src[srcIdx + startIdx];
            }
        }
        __syncthreads();

        for (int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE; startIdx < stride; startIdx += VT * WARP_SIZE * MAX_DIM_SIZE) {
            #pragma unroll
            for (int i = 0; i < VT; i++) {
                const int featureIdx = startIdx + i * WARP_SIZE;
                if (featureIdx < stride) {
                    tensor[targetIdx + featureIdx] = sharedSrc[featureIdx];
                }
            }
        }
    }
}