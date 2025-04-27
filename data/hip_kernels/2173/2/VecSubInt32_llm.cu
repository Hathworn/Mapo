#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecSubInt32(int32_t* in0, int32_t* in1, int32_t* out, int cnt)
{
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop to process multiple elements per thread
    for (int i = tid; i < cnt; i += blockDim.x * gridDim.x) {
        out[i] = in0[i] - in1[i];
    }
}