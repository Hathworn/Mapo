#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddKernel(float* deviceA, float* deviceB, float* deviceResult, int n) {
    unsigned i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use if condition to avoid accessing out of bounds
    if (i < n) {
        deviceResult[i] = deviceA[i] + deviceB[i];
    }
}