#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous(float *tensor, float *src, long stride, float *index, long idxSize)
{
    const int VT = 4;
    const int WARP_SIZE = 32;
    const int MAX_DIM_SIZE = 65535;

    // Calculate the index based on block and thread info
    int idx = blockIdx.x * blockDim.y + threadIdx.y;
    int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE;

    while (idx < idxSize) {
        while (startIdx < stride) {
            const int srcIdx = ((int)index[idx] - 1) * stride;
            const int targetIdx = idx * stride;

            // Unrolled loop to improve memory coalescing
            #pragma unroll
            for (int i = 0; i < VT; i++) {
                const int featureIdx = startIdx + i * WARP_SIZE;
                if (featureIdx < stride) {
                    tensor[targetIdx + featureIdx] = src[srcIdx + featureIdx];
                }
            }
            startIdx += VT * WARP_SIZE * MAX_DIM_SIZE;
        }
        idx += blockDim.y * MAX_DIM_SIZE;
    }
}