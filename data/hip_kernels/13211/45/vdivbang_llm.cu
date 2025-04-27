#include "hip/hip_runtime.h"
#include "includes.h"

// a simple CUDA kernel to element multiply two vectors C=alpha*A.*B

extern "C"   // ensure function name to be exactly "vmult!"
{
}

__global__ void vdivbang(const int lengthA, const double alpha, const double *a, const double *b, double *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Unrolling loop for coalesced global memory access and better occupancy
    int stride = gridDim.x * blockDim.x;
    while (i < lengthA) {
        c[i] = alpha * a[i] / b[i];
        i += stride;
    }
}