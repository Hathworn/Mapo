#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D blockIdx
    if(id >= n) return;

    int k = id % c;
    int b = id / c; // Use integer division

    int out_index = k + c * b;
    float out_delta_val = out_delta[out_index] / (w * h); // Precompute constant division
    for(int i = 0; i < w * h; ++i){
        int in_index = i + h * w * out_index; // Reuse computed out_index
        atomicAdd(&in_delta[in_index], out_delta_val); // Use atomicAdd for concurrent writes
    }
}