#include "hip/hip_runtime.h"
#include "includes.h"

// Use __restrict__ to suggest to the compiler that pointers do not alias
__global__ void calcPixelVal(float* __restrict__ g_idata, const float* __restrict__ constant, const float* __restrict__ min)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a register to store the minimum value to reduce memory access
    float minVal = *min;

    // Optimize boundary check and calculation by merging conditions
    if(i < LENA_SIZE)
    {
        g_idata[i] = (g_idata[i] - minVal) * (*constant);
    }
}