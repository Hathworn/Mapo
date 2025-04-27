#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function
__global__ void decrement(char* current, char* answer) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Ensure global indexing
    if (i < N) { // Boundary check for the array to avoid out-of-bounds access
        answer[i] = current[i] - 1;  // Direct character arithmetic
    }
}