#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void initializeBiasKernel_tanh(float* b, int size) {

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use stride loop to ensure all elements are initialized
    while (index < size) {
        b[index] = 0.0f; // Use 0.0f for better floating-point consistency
        index += stride;
    }
}