#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mix32_2_1(int64_t * ip, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples)
{
    int z = blockDim.x * blockIdx.x + threadIdx.x;

    // Early exit for out-of-bound threads
    if (z >= numSamples)
        return;

    int64_t temp = ip[z];

    // Directly assign to minimize conversion repetition
    u[z] = static_cast<int32_t>(temp);
    v[z] = static_cast<int32_t>(temp >> 32);
}