#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kDivide(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate the thread's global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride to handle all elements
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        // Perform division if not dividing by zero
        if (b[i] != 0.0f) {
            dest[i] = a[i] / b[i];
        } else {
            dest[i] = 0.0f;  // Handle division by zero
        }
    }
}