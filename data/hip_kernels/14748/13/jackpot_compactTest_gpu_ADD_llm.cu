#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void jackpot_compactTest_gpu_ADD(uint32_t *data, uint32_t *partial_sums, int len)
{
    __shared__ uint32_t buf;
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread accesses within bounds
    if (id >= len) return;

    // Load from global memory to shared memory by first thread
    if (threadIdx.x == 0) {
        buf = partial_sums[blockIdx.x];
    }

    __syncthreads();

    // Add shared memory value
    data[id] += buf;
}