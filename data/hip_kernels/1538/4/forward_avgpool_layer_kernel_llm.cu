#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int spatial_area = w * h;
    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    float sum = 0.0f;
    
    // Unroll loop for potential performance gain
    for(int i = 0; i < spatial_area; ++i) {
        int in_index = i + spatial_area * (k + b * c);
        sum += input[in_index];
    }
    output[out_index] = sum / spatial_area; // Calculate average
}