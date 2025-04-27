```cuda
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation
    if (i < N)  // Prevent out-of-bounds memory access (Assuming N is defined and known)
    {
        c[i] = a[i] + b[i]; // Perform vector addition
    }
}