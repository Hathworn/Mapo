#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void incrValue(float *data, int idx, float value) {
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        atomicAdd(&data[idx], value); // Use atomic operation for safe value increment
    }
}