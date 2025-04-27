#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate the scale outside the loop
    float scale = 1.f / (batch * spatial);
    int filter_id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Exit if thread is out of bounds
    if (filter_id >= filters) return;
    
    float sum = 0.0f;
    
    // Unroll the loops for potential performance gain
    for (int j = 0; j < batch; ++j){
        for (int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + filter_id * spatial + k;
            sum += x[index];
        }
    }
    
    // Apply scaling at the end
    mean[filter_id] = sum * scale;
}