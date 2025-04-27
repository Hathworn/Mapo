#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAddInt32(int32_t* in0, int32_t* in1, int32_t* out, int cnt)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int step = blockDim.x * gridDim.x;  // Calculate step size for loop unrolling
    for(int i = tid; i < cnt; i += step) {  // Loop unrolling optimization
        out[i] = in0[i] + in1[i];
    }
}