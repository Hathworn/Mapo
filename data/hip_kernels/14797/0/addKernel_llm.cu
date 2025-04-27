#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

// Kernel function with improved parallel execution setup
__global__ void addKernel(int *c, const int *a, const int *b, unsigned int size) 
{
    // Calculate global index based on block and thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within the array bounds
    if (i < size) {
        c[i] = a[i] + b[i];
    }
}