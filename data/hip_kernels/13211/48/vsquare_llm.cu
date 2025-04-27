#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{
}

__global__ void vsquare(const double *a, double *c)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use conditional to prevent out-of-bounds memory access
    if (i < N)  // Replace N with the maximum index or size of the array
    {
        double v = a[i];
        c[i] = v * v;
    }
}