#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_zero_nonmax_kernel(int n, float *input, float *output)
{
    // Calculate unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Iterate over input/output arrays using stride
    for (; id < n; id += stride) {
        if (input[id] != output[id]) 
            output[id] = 0;
    }
}