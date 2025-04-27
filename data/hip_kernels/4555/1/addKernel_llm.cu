#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global index
    if (i < N) { // Add boundary check to prevent out-of-bounds memory access
        c[i] = a[i] + b[i];
    }
}