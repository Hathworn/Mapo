#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *output, int length, int *n) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (index < length * gridDim.x) { // Check bounds
        output[index] += n[blockIdx.x]; // Perform addition
    }
}