#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_indexSelect_contiguous(float *tensor, float *src, long stride, float *index, long idxSize)
{
    // Constants
    const int VT = 4;  // Vectorized load/store factor
    const int WARP_SIZE = 32;  // Number of threads in a warp

    // Calculate unique global thread index
    int idx = blockIdx.x * blockDim.y + threadIdx.y;
    int startIdx = threadIdx.x + blockIdx.y * VT * WARP_SIZE;

    // Optimize loop control and increments for larger strides
    for (; idx < idxSize; idx += blockDim.y * gridDim.x) {
        long srcIdx = static_cast<long>(index[idx]) - 1;
        srcIdx *= stride;
        long targetIdx = idx * stride;

        for (int offset = startIdx; offset < stride; offset += VT * WARP_SIZE * gridDim.y) {

            // Unroll load/store with better warp utilization
            #pragma unroll
            for (int i = 0; i < VT; i++) {
                int featureIdx = offset + i * WARP_SIZE;
                if (featureIdx < stride) {
                    tensor[targetIdx + featureIdx] = src[srcIdx + featureIdx];
                }
            }
        }
    }
}