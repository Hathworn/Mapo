#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecSubFp32(float* __restrict__ in0, float* __restrict__ in1, float* __restrict__ out, int cnt)
{
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if (tid < cnt) {
        // Perform subtraction
        out[tid] = in0[tid] - in1[tid];
    }
}