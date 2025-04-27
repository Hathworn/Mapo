#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAddFp32(float* in0, float* in1, float* out, int cnt)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop
    for (int i = tid; i < cnt; i += stride) { // Apply grid-stride loop
        out[i] = in0[i] + in1[i];
    }
}