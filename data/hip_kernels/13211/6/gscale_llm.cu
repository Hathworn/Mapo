#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void gscale(const int lengthB, const double *a, double *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use coalesced memory accesses by ensuring each thread accesses consecutive memory locations.
    if (i < lengthB)
    {
        double scale_factor = a[0]; // Store the constant factor in a local variable to avoid repeated global memory reads.
        b[i] *= scale_factor; // Optimize memory access by reading a[0] once.
    }
}