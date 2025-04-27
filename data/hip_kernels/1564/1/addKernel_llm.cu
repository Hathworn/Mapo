#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using block and thread indices to handle larger arrays
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Get global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform addition for this thread's designated index
    c[i] = a[i] + b[i];
}