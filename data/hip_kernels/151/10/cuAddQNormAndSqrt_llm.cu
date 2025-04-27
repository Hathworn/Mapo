#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuAddQNormAndSqrt(float *vec1, float *vec2, int width) {
    // Use shared memory for faster access (if possible with data size)
    extern __shared__ float sharedVec1[];

    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if (xIndex < width) {
        // Load data into shared memory for faster access
        sharedVec1[threadIdx.x] = vec1[xIndex];
        
        // Use intrinsic function for sqrt (if supported)
        float val = __sqrtf(sharedVec1[threadIdx.x] + vec2[xIndex]);

        // Store result back to global memory
        vec1[xIndex] = val;
    }
}