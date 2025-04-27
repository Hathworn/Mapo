#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecSubInt32(int32_t* __restrict__ in0, int32_t* __restrict__ in1, int32_t* __restrict__ out, int cnt)
{
    // Using shared memory to reduce global memory access times
    extern __shared__ int32_t shared_in0[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    // Load current block's data into shared memory
    if (tid < cnt) {
        shared_in0[local_tid] = in0[tid];
        __syncthreads();

        // Perform subtraction using shared memory
        out[tid] = shared_in0[local_tid] - in1[tid];
    }
}