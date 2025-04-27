#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous(float *tensor, float *src, long stride, float *index, long idxSize) {
    // Constants for vectorized processing
    const int VT = 4;
    const int WARP_SIZE = 32;
    const int MAX_DIM_SIZE = 65535;

    // Calculate starting position in the index array per thread block
    int idx = blockIdx.x * blockDim.y + threadIdx.y;
    while (idx < idxSize) {
        // Calculate starting position in tensor source per thread block
        int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE;
        while (startIdx < stride) {
            // Compute source and target indices
            const long srcIdx = ((long)index[idx] - 1) * stride;
            const long targetIdx = idx * stride;
            
            // Unroll loop to improve memory coalescing
            #pragma unroll
            for (int i = 0; i < VT; i++) {
                const int featureIdx = startIdx + i * WARP_SIZE;
                if (featureIdx < stride) {
                    tensor[targetIdx + featureIdx] = src[srcIdx + featureIdx];
                }
            }
            
            // Step to the next section in the stride
            startIdx += VT * WARP_SIZE * MAX_DIM_SIZE;
        }
        
        // Step to the next section in the idxSize
        idx += blockDim.y * MAX_DIM_SIZE;
    }
}