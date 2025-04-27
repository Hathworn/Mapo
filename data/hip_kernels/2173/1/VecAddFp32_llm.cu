#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAddFp32(float* __restrict__ in0, float* __restrict__ in1, float* __restrict__ out, int cnt)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use grid-stride loop for better performance on large data
    int stride = blockDim.x * gridDim.x;
    for (int i = tid; i < cnt; i += stride) {
        out[i] = in0[i] + in1[i];
    }
}