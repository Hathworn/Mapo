#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Calculate global index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;
    
    // Determine batch index and channel index
    int k = id % c;
    int b = id / c;
    
    // Precompute indices
    int out_index = k + c * b;
    int in_base_index = h * w * (k + b * c);
    
    // Initialize output to zero
    float sum = 0.0f;
    
    // Accumulate input values
    for(int i = 0; i < w * h; ++i){
        sum += input[in_base_index + i];
    }
    
    // Compute average
    output[out_index] = sum / (w * h);
}
```
