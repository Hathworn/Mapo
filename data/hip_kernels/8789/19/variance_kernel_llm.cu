#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Pre-compute scale factor outside of kernel loop for efficiency
    float scale = 1.0f / (batch * spatial - 1);
    
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use blockDim.y to distribute filters among multiple blocks if needed
    if (i >= filters) return;
    
    float var = 0.0f;
    
    // Combine nested loops to use single loop for better cache coherence
    for(int j = 0; j < batch * spatial; ++j) {
        int index = j * filters + i; // Directly access flattened index
        var += powf((x[index] - mean[i]), 2); // Utilize powf for single-precision float
    }
    
    variance[i] = var * scale;
}