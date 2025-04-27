#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if(id >= n * c * w * h) return; // Expanded the range check to include all indexes

    int in_index = id;
    int k = id / (w * h) % c; // Calculate k from the id
    int b = id / (w * h * c); // Calculate b from the id

    int out_index = k + c * b; // Output index calculation
    in_delta[in_index] += out_delta[out_index] / (w * h); // Compute and accumulate delta
}