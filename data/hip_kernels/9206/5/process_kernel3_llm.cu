#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void process_kernel3(const float* input, float* output, int numElements) {
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize global thread ID calculation
    int stride = blockDim.x * gridDim.x;  // Calculate stride for grid-stride loop

    for (int i = globalThreadId; i < numElements; i += stride) { // Use grid-stride loop for better parallelism
        output[i] = sqrtf(input[i]);  // Use single precision sqrt function
    }
}