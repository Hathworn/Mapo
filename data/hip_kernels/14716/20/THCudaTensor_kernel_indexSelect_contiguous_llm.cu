#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous(float *tensor, float *src, long stride, float *index, long idxSize)
{
    const int VT = 4;
    const int WARP_SIZE = 32;
    const int MAX_DIM_SIZE = 65535;

    int idx = blockIdx.x * blockDim.y + threadIdx.y;
    int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE;

    if (idx < idxSize && startIdx < stride) { // Check bounds to avoid unnecessary loops
        const long srcIdx = ((long)index[idx] - 1) * stride;
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