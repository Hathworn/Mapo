#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void process_kernel2(const float* input, float* output, int numElements) {
    // Calculate global thread index more efficiently
    int globalThreadId = blockIdx.x * blockDim.x * blockDim.y * blockDim.z 
                        + blockIdx.y * blockDim.x * blockDim.z
                        + blockIdx.z * blockDim.z
                        + threadIdx.z * blockDim.x * blockDim.y 
                        + threadIdx.y * blockDim.x 
                        + threadIdx.x;

    if (globalThreadId < numElements) {
        output[globalThreadId] = logf(fabsf(input[globalThreadId])); // Use faster single-precision math operations
    }
}