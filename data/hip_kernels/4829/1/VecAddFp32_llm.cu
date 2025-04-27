#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAddFp32(float* __restrict__ in0, float* __restrict__ in1, float* __restrict__ out, int cnt)
{
    // Use local variable to minimize global memory access latency
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < cnt) {
        float a = in0[tid];
        float b = in1[tid];
        out[tid] = a + b;
    }
}