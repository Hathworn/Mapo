#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initializeBiasKernel_relu(float* b, int size) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride loop for better coalescing and efficiency
    for (int i = index; i < size; i += blockDim.x * gridDim.x) {
        b[i] = 0.0;
    }
}