#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAddInt32(int32_t* in0, int32_t* in1, int32_t* out, int cnt)
{
    // Use shared memory for potential optimization
    extern __shared__ int32_t s_in0[];
    extern __shared__ int32_t s_in1[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    // Load data into shared memory
    if (tid < cnt) {
        s_in0[local_tid] = in0[tid];
        s_in1[local_tid] = in1[tid];
        __syncthreads(); // Ensure all data is loaded before proceeding

        // Perform vector addition
        out[tid] = s_in0[local_tid] + s_in1[local_tid];
    }
}