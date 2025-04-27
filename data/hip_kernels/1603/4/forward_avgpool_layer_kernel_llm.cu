#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int spatial_size = w * h; // Calculate spatial size outside loop
    int k = id % c;
    int b = id / c;

    float sum = 0.0f; // Use a local variable for sum
    int out_index = k + c * b;
    int offset = h * w * (k + b * c); // Precompute input offset
    for(int i = 0; i < spatial_size; ++i){
        sum += input[offset + i]; // Use offset in accessing input
    }
    output[out_index] = sum / spatial_size; // Store the result directly
}