#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{

} // extern "C"

__global__ void vadd(const float *a, const float *b, float *c)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check to prevent out-of-bounds memory access
    if (i < gridDim.x * blockDim.x) 
    {
        c[i] = a[i] + b[i];
    }
}