#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void doubleToFloat(const double* __restrict__ input, float* __restrict__ output, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use shared memory for coalesced access if necessary
    if (i < numElements)
    {
        output[i] = __double2float_rd(input[i]); // Use intrinsic for type conversion
    }
}