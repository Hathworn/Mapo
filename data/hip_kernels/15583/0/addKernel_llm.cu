#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

// Optimized kernel function using blockIdx and blockDim
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (i < size) { // Check bounds to prevent out-of-range memory access
        c[i] = a[i] + b[i];
    }
}