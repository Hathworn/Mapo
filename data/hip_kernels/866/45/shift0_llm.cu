#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shift0(float* in, float* out, int inDim0, int inStride0, int inStride1, int inScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory for better memory access pattern if data reuse is possible (not utilized here but an idea to consider)
    // __shared__ float sharedMem[BLOCK_SIZE];

    while (tid < inScalarCount) { // Change for loop to while loop for potential readability and slight overhead reduction
        int linearIndex = tid;
        int inIndex0 = linearIndex / inStride0;
        linearIndex -= inIndex0 * inStride0; // Use compound assignment for clarity
        int inIndex1 = linearIndex / inStride1;

        // Remove if condition and use mask to ensure 'out' assignment only when the condition is met
        // This aids warp efficiency by avoiding divergent branches
        bool valid = (inIndex0 + inIndex1 < inDim0);
        out[tid + inIndex1 * inStride0] = valid ? in[tid] : 0.0f;

        tid += stride;
    }
}