#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void g_FullConnectDropout(float * outputs, float * drop, int len)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient loop by striding across the data
    for (int i = id; i < len; i += blockDim.x * gridDim.x)
    {
        outputs[i] *= drop[i]; // Apply dropout
    }
}