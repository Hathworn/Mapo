#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *dev_a, int* x)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x; // Allow for grid stride
    if (i < *x) // Bounds check to avoid out-of-bound access
    {
        dev_a[i] = (dev_a[i] < *x) ? 0 : 1; // Use ternary operator for simplicity
    }
}