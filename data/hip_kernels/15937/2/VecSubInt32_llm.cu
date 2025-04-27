```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecSubInt32(int32_t* in0, int32_t* in1, int32_t* out, int cnt)
{
    // Use shared memory for faster access if needed (uncomment if applicable)
    // __shared__ int32_t shared_in0[BLOCK_SIZE];
    // __shared__ int32_t shared_in1[BLOCK_SIZE];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling loop if there were multiple operations - Not applicable here, single operation
    if (tid < cnt) {
        out[tid] = in0[tid] - in1[tid];
    }
}