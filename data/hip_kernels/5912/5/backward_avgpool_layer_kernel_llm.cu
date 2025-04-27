```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Use flat indexing for block
    if(id >= n * c) return;  // Adjust range check for combined c and n

    int k = id % c;
    int b = id / c;  // Directly calculate batch index

    float out_val = out_delta[k + c*b] / (w*h);  // Precompute common value

    for(int i = 0; i < w*h; ++i) {
        int in_index = i + h*w*(k + b*c);
        atomicAdd(&in_delta[in_index], out_val);  // Use atomicAdd for safer addition
    }
}