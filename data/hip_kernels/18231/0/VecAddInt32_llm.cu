#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAddInt32(int32_t* __restrict__ in0, int32_t* __restrict__ in1, int32_t* __restrict__ out, int cnt)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Loop over all elements in the stride using the grid-stride loop
    for (int i = tid; i < cnt; i += stride) {
        out[i] = in0[i] + in1[i];
    }
}