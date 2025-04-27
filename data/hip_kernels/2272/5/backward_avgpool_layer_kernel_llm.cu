#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified and removed gridDim.y
    if(id >= n * c) return; // Check for out of bounds

    int k = id % c;
    int b = id / c; // Use integer division to calculate b

    int out_index = k + c * b;
    float out_delta_value = out_delta[out_index] / (w * h); // Precompute shared division

    for(int i = 0; i < w * h; ++i) {
        int in_index = i + h * w * out_index; // Reuse computed out_index
        atomicAdd(&in_delta[in_index], out_delta_value); // Use atomicAdd for concurrent updates
    }
}