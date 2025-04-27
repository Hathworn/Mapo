#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void jackpot_compactTest_gpu_ADD(uint32_t *data, uint32_t *partial_sums, int len)
{
    __shared__ uint32_t buf;
    int id = ((blockIdx.x * blockDim.x) + threadIdx.x);

    if (id >= len) return; // Use '>=' to correctly handle boundary condition

    if (threadIdx.x == 0)
    {
        buf = partial_sums[blockIdx.x]; // Initialize shared memory with partial sums
    }

    __syncthreads();
    data[id] += buf; // Add the buffer to each data element
}