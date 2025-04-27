#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initializeBiasKernel_softmax(float* b, int size) {
    // Use a more efficient stride loop for larger datasets
    for (int index = blockIdx.x * blockDim.x + threadIdx.x; index < size; index += blockDim.x * gridDim.x) {
        b[index] = 0.0f;
    }
}