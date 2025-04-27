#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void test(float* nonSmoothed, float* smoothed, int* mask, int nhalf) {
    // Use shared memory for low latency access
    extern __shared__ float sharedSmoothed[];

    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Load smoothed value to shared memory
    if (i < nhalf) {
        sharedSmoothed[threadIdx.x] = smoothed[i];
    }
    __syncthreads();

    // Ensure index is within bounds
    if (i < nhalf) {
        // Calculate difference using shared memory value
        float diff = fabs(nonSmoothed[i] - sharedSmoothed[threadIdx.x] / nhalf);
        mask[i] = (diff > 0.23f) ? 1 : 0;   // Apply threshold
    }
}