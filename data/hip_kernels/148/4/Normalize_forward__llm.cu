#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define GS(x) (((x) - 1) / TB + 1)

__global__ void Normalize_forward_(float *input, float *norm, float *output, int size23, int size123, int size0123)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size0123) {
        int dim23 = id % size23;
        int dim0 = id / size123;
        
        // Cache the norm value to reduce global memory access latency
        float cachedNorm = norm[dim0 * size23 + dim23];
        output[id] = input[id] / sqrtf(cachedNorm);
    }
}