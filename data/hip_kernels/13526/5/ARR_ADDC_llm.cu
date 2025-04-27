#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ARR_ADDC(float* __restrict__ result, const float* __restrict__ in1, const float* __restrict__ in2, int N)
{
    // Calculate global thread index
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure index is within bounds
    if (index < N)
    {
        // Perform addition
        result[index] = in1[index] + in2[index];
    }
}