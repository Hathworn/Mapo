#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c;

    // Precompute and store parameters to reduce redundant calculations.
    int out_index = k + c * b;
    int offset = h * w * (k + b * c);
    float sum = 0.0f;

    // Use a local register variable 'sum' inside the loop for accumulation.
    for(int i = 0; i < w * h; ++i){
        sum += input[i + offset];
    }

    // Lazy evaluation enhancement: the calculation of division is done after loop completion.
    output[out_index] = sum / (w * h);
}