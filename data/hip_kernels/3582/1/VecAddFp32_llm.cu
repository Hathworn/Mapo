#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAddFp32(float* in0, float* in1, float* out, int cnt)
{
    // Improved access pattern for performance
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;
    
    for (int i = tid; i < cnt; i += totalThreads) {
        out[i] = in0[i] + in1[i];
    }
}