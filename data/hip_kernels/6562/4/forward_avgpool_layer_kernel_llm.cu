#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int batch_size = n / c;  // Compute batch size
    int b = id / c;          // Calculate batch index
    int k = id % c;          // Calculate channel index

    float sum = 0;
    int start_index = h * w * (k + b * c); // Pre-compute start index
    for(int i = 0; i < w * h; ++i) {
        sum += input[start_index + i];
    }
    output[k + c * b] = sum / (w * h);      // Assign computed average to output
}