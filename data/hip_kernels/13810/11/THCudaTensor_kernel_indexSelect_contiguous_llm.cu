#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous(float *tensor, float *src, long stride, float *index, long idxSize) {
    // Use constant for vectorization and warp size
    const int VT = 4;
    const int WARP_SIZE = 32;
    const int MAX_DIM_SIZE = 65535;

    // Calculate global thread index for coalesced memory access
    int idx = blockIdx.x * blockDim.y + threadIdx.y;
    int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE;

    while (idx < idxSize) {
        int srcIdx = ((int) index[idx] - 1) * stride;
        int targetIdx = idx * stride;

        #pragma unroll
        for (int i = 0; i < VT; i++) {
            int featureIdx = startIdx + i * WARP_SIZE;
            if (featureIdx < stride) {
                tensor[targetIdx + featureIdx] = src[srcIdx + featureIdx];
            }
        }
        idx += blockDim.y * MAX_DIM_SIZE;  // Increment index for next block
    }
}