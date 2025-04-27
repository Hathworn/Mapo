#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use block and thread indexing for better scalability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) { // Ensure i is within bounds
        c[i] = a[i] + b[i];
    }
}