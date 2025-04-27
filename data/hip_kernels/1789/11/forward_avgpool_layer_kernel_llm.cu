#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;

    // Initialize sum accumulator
    float sum = 0.0f;
    
    // Compute input base index for the current output element
    int input_base_index = h * w * (k + b * c);

    // Accumulate sum for the [w*h] elements related to the current output
    for(int i = 0; i < w * h; ++i) {
        sum += input[input_base_index + i];
    }

    // Compute the average and store it in the output
    output[out_index] = sum / (w * h);
}