#include "hip/hip_runtime.h"
#include "includes.h"

// Device Function for process_kernel1


// Device Function for process_kernel2


// Device Function for process_kernel3

__global__ void process_kernel3(const float* input, float* output, int numElements) {

    // Calculate the unique thread ID directly using grid and block calculations
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x + 
                         (blockIdx.y * blockDim.y + threadIdx.y) * blockDim.x * gridDim.x + 
                         (blockIdx.z * blockDim.z + threadIdx.z) * blockDim.x * blockDim.y * gridDim.x * gridDim.y;

    // Check if globalThreadId is within the range of numElements
    if (globalThreadId < numElements) {
        // Compute the square root and store it in the output array
        output[globalThreadId] = sqrtf(input[globalThreadId]);
    }
}