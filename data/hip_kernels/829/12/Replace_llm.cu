#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Replace(const float * __restrict__ WHAT, float * __restrict__ WHERE)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < gridDim.x * blockDim.x) // Check bounds
    {
        WHERE[idx] = WHAT[idx]; // Copy data from WHAT to WHERE
    }
}