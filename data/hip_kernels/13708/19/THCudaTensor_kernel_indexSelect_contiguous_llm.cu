#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous(float *tensor, float *src, long stride, float *index, long idxSize) {
    // Launch a sufficient number of threads per block
    const int VT = 4;
    const int WARP_SIZE = 32;
    const int MAX_DIM_SIZE = 65535;
    const int blockStride = blockDim.y * MAX_DIM_SIZE;
    const int warpStride = VT * WARP_SIZE * MAX_DIM_SIZE;

    // Use grid-stride loops for better parallelization and scalability
    for (int idx = blockIdx.x * blockDim.y + threadIdx.y; idx < idxSize; idx += blockStride) {
        for (int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE; startIdx < stride; startIdx += warpStride) {
            const int srcIdx = ((int)index[idx] - 1) * stride;
            const int targetIdx = idx * stride;

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