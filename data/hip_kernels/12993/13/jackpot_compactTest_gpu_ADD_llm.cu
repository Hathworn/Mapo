#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void jackpot_compactTest_gpu_ADD(uint32_t *data, uint32_t *partial_sums, int len)
{
    __shared__ uint32_t buf;
    int id = ((blockIdx.x * blockDim.x) + threadIdx.x);

    if (id >= len) return; // Correct boundary condition (>=) for global threads

    // Use a local variable to reduce global memory accesses
    int thread_id = threadIdx.x;

    if (thread_id == 0)
    {
        buf = partial_sums[blockIdx.x]; // Load partial sum into shared memory
    }

    __syncthreads(); // Ensure the partial sum is loaded before adding

    // Reduce shared memory bank conflicts by using local variable
    uint32_t temp_buf = buf; 
    data[id] += temp_buf;
}