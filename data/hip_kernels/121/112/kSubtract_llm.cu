#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSubtract(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate the index based on block and thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride to allow each thread to process multiple elements
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop through elements, processing multiple indices
    for (unsigned int i = idx; i < numEls; i += stride) {
        dest[i] = a[i] - b[i]; // Element-wise subtraction
    }
}