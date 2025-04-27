#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void process_kernel3(const float* __restrict__ input, float* __restrict__ output, int numElements) {
    // Compute global thread ID using simpler calculation
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x + 
                         blockIdx.y * blockDim.y * gridDim.x + threadIdx.y * blockDim.x * gridDim.x + 
                         blockIdx.z * blockDim.z * gridDim.x * gridDim.y + threadIdx.z * blockDim.x * gridDim.x * gridDim.y;

    if (globalThreadId < numElements) {
        output[globalThreadId] = sqrtf(input[globalThreadId]); // Use sqrtf for single precision
    }
}