#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void process_kernel3(const float* input, float* output, int numElements) {
    // Calculate global thread ID optimized for 3D grid and block
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x 
                       + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x 
                       + (blockIdx.z * blockDim.z + threadIdx.z) * gridDim.x * gridDim.y * blockDim.x * blockDim.y;

    // Only process valid threads
    if (globalThreadId < numElements) {
        output[globalThreadId] = (float)sqrt(input[globalThreadId]);
    }
}