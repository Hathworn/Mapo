#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel definition 
// Efficiency improvement: Add useful computation inside the kernel
__global__ void kernel (int* data, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        // Perform a sample operation
        data[idx] = data[idx] * 2; // Example operation: doubling the value
    }
}