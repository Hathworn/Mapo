#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecSubInt32(int32_t* __restrict__ in0, int32_t* __restrict__ in1, int32_t* __restrict__ out, int cnt)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better efficiency
    for (int i = tid; i < cnt; i += blockDim.x * gridDim.x) {
        out[i] = in0[i] - in1[i];
    }
}