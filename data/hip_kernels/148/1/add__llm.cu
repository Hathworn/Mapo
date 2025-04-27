```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define GS(x) (((x) - 1) / TB + 1)

__global__ void add_(float *input, float value, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unrolling the loop for better performance
    for (int i = id; i < size; i += blockDim.x * gridDim.x) {
        input[i] = input[i] + value;
    }
}