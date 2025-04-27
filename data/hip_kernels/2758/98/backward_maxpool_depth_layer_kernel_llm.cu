#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_depth_layer_kernel(int n, int w, int h, int c, int batch, float *delta, float *prev_delta, int *indexes)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation
    if (id < n) // Reverse if condition for early exit
    {
        int index = indexes[id];
        atomicAdd(&prev_delta[index], delta[id]); // Use atomic operation to avoid race conditions
    }
}