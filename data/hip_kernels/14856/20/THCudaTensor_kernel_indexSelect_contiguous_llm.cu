#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous(float *tensor, float *src, long stride, float *index, long idxSize) {
    // Constants
    const int VT = 4;
    const int WARP_SIZE = 32;
    const int MAX_DIM_SIZE = 65535;

    // Calculate index using block and thread index
    int idx = blockIdx.x * blockDim.y + threadIdx.y;
    int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE;

    // Loop through idx in steps to handle larger inputs
    while (idx < idxSize) {
        int start = startIdx;
        // Loop through startIdx to handle larger strides
        while (start < stride) {
            const long srcIdx = ((long)index[idx] - 1) * stride;
            const long targetIdx = idx * stride;

            // Unrolled loop to handle multiple elements per thread
            #pragma unroll
            for (int i = 0; i < VT; i++) {
                const int featureIdx = start + i * WARP_SIZE;
                // Ensure we are within stride limits
                if (featureIdx < stride) {
                    tensor[targetIdx + featureIdx] = src[srcIdx + featureIdx];
                }
            }
            start += VT * WARP_SIZE * MAX_DIM_SIZE;
        }
        idx += blockDim.y * MAX_DIM_SIZE;
    }
}