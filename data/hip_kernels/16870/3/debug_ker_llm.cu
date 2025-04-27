#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function with improved memory access pattern
__global__ void debug_ker(float* ptr, int addr) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate thread index
    if (i == 0) { // Ensure only one thread prints to reduce contention
        printf("%d %f\n", addr, ptr[addr]); // Print the value at the specified address
    }
}