#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReluBackKernel(float* Z, float* dZ, int size) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Check within grid-stride loop for better efficiency
    for (int idx = id; idx < size; idx += blockDim.x * gridDim.x) {
        // Use a single statement for condition
        dZ[idx] = Z[idx] > 0 ? dZ[idx] : 0;
    }
}