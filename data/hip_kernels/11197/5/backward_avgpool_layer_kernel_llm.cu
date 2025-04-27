#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    // Calculate the unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n * w * h) return;  // Ensure index within bounds

    // Efficiently determine b (batch), k (channel), and pixel indices
    int pixel_idx = id % (w * h);
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    // Compute indices
    int in_index = pixel_idx + h * w * (k + b * c);
    int out_index = k + c * b;

    // Atomic addition to prevent race conditions
    atomicAdd(&in_delta[in_index], out_delta[out_index] / (w * h));
}