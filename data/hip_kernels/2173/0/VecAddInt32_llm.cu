#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAddInt32(int32_t* in0, int32_t* in1, int32_t* out, int cnt)
{
    // Use shared memory to reduce global memory accesses
    extern __shared__ int32_t shared_in0[];
    extern __shared__ int32_t shared_in1[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    if (tid < cnt) {
        // Load data into shared memory
        shared_in0[local_tid] = in0[tid];
        shared_in1[local_tid] = in1[tid];
        __syncthreads(); // Synchronize to ensure data is loaded completely

        // Compute vector addition using shared memory
        out[tid] = shared_in0[local_tid] + shared_in1[local_tid];
    }
}