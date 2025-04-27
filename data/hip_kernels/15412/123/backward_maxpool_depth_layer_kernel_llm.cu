#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_depth_layer_kernel(int n, int w, int h, int c, int batch, float *delta, float *prev_delta, int *indexes)
{
    // Calculate the unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the current thread is within bounds
    if (id < n) {
        int index = indexes[id];
        atomicAdd(&prev_delta[index], delta[id]); // Use atomicAdd to avoid race conditions
    }
}