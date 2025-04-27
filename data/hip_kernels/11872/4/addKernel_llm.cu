#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Compute global thread index to handle larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate total number of threads
    int gridSize = blockDim.x * gridDim.x;

    // Loop to cover all elements (useful for arrays larger than the number of threads)
    while (i < N) {  // Assume N is defined elsewhere
        c[i] = a[i] + b[i];
        i += gridSize;
    }
}