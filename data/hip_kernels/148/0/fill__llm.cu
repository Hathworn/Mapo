#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define GS(x) (((x) - 1) / TB + 1)

__global__ void fill_(float *input, float value, int size)
{
    // Use vectorized memory access for better efficiency
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop through all elements assigned to the thread
    for (int idx = id; idx < size; idx += stride) {
        input[idx] = value;
    }
}