#include "hip/hip_runtime.h"
#include "includes.h"

// filename: vsquare.cu
// a simple CUDA kernel to element multiply vector with itself

extern "C" // ensure function name to be exactly "vsquare"
{
}

__global__ void expkernel(const int lengthA, const double *a, double *b)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Unroll loops for better memory coalescing
    int stride = blockDim.x * gridDim.x;
    for (int index = i; index < lengthA; index += stride)
    {
        b[index] = exp(a[index]);
    }
}