#include "hip/hip_runtime.h"
#include "includes.h"
// filename: vmult!.cu
// a simple CUDA kernel to element multiply two vectors C=alpha*A.*B

extern "C"   // ensure function name to be exactly "vmult!"
{
}

// Optimized kernel function
__global__ void vdivbangupdate(const int lengthA, const double alpha, const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < lengthA) // Check bounds
    {
        c[i] += alpha * a[i] / b[i]; // Perform operation
    }
}