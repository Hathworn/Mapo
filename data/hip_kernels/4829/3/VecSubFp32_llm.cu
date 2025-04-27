#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecSubFp32(float* __restrict__ in0, float* __restrict__ in1, float* __restrict__ out, int cnt)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < cnt) {
        out[tid] = __fsub_rn(in0[tid], in1[tid]); // Use fast sub intrinsic
    }
}