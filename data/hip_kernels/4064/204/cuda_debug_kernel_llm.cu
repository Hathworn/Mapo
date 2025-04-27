#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_debug_kernel()
{
    const int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    // Add any additional code or computation needed here using idx, if required
}