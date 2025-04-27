#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleArray(const int n, const float c, float* __restrict__ a) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < n) {
        // Using __restrict__ to potentially increase memory access efficiency
        a[i] *= c; // Simplified the multiplication operation
    }
}