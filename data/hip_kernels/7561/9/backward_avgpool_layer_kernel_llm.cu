#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (int idx = id; idx < n; idx += stride) { // Loop unrolling for better occupancy
        int k = idx % c;
        int b = idx / c;
        
        int out_index = k + c * b;
        float shared_out_delta = out_delta[out_index] / (w * h); // Store division result in shared variable
        
        for (int i = 0; i < w * h; ++i) {
            int in_index = i + h * w * (k + b * c);
            atomicAdd(&in_delta[in_index], shared_out_delta); // Use atomicAdd for concurrent writes
        }
    }
}