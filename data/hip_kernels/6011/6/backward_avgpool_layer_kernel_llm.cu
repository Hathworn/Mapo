#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n * w * h) return;  // Simplify boundary condition

    int pool_size = w * h;  // Pre-calculate pool size
    int b = id / pool_size; // Compute batch index
    int i = id % pool_size; // Compute local pool index
    
    int k = b % c;          // Compute channel index
    b /= c;

    int in_index = i + pool_size * (k + b * c);
    int out_index = k + c * b;

    in_delta[in_index] += out_delta[out_index] / pool_size;  // Use pre-calculated pool_size
}