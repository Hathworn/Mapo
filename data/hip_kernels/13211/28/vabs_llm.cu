#include "hip/hip_runtime.h"
#include "includes.h"

// filename: vmult!.cu
// a simple CUDA kernel to element multiply two vectors C=alpha*A.*B

extern "C" // ensure function name to be exactly "vmult!"
{
}

__global__ void vabs(const int n, const double *a, double *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to improve memory coalescing
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x)
    {
        b[idx] = fabs(a[idx]);
    }
}