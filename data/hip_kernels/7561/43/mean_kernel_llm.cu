#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate scale factor
    float scale = 1.0f / (batch * spatial);
    
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return if thread ID exceeds the number of filters
    if (i >= filters) return;
    
    // Initialize mean for the current filter
    float sum = 0.0f;
    
    // Use shared memory to reduce global memory access latency
    extern __shared__ float sharedData[];
    
    // Loop through batches and spatial elements
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index];
        }
    }
    
    // Store the result in the global mean array
    mean[i] = sum * scale;
}