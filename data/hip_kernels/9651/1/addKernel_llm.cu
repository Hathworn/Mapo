#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel to handle more than one element per thread
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    int stride = gridDim.x * blockDim.x; // Calculate stride for grid handling
    for (; i < N; i += stride) // Loop over all elements with stride
    {
        c[i] = a[i] + b[i]; // Perform addition
    }
}