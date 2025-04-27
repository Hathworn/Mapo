#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void addArrays(int* a, int* b, int* c, int size)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within array bounds
    if (i < size) {
        // Perform addition
        c[i] = a[i] + b[i];
    }
}