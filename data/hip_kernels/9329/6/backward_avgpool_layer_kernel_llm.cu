#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if(id >= n * w * h) return; // Modified bounds check using total elements

    int b = id / (w * h * c); // Batch index
    int k = (id / (w * h)) % c; // Channel index
    int i = id % (w * h); // Spatial index

    int in_index = i + h*w*(k + b*c);
    int out_index = (k + c*b);

    // Perform reduction across spatial dimensions for avg pooling
    atomicAdd(&in_delta[in_index], out_delta[out_index] / (w*h)); 
}