```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate the scale once before the loop starts
    float scale = 1.0f / (batch * spatial - 1);
    
    // Use grid-stride loop for better utilization of threads
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < filters; i += blockDim.x * gridDim.x) {
        float var_sum = 0.0f;
        
        // Unroll the loops for potential performance gain
        for (int j = 0; j < batch; ++j) {
            for (int k = 0; k < spatial; ++k) {
                int index = j * filters * spatial + i * spatial + k;
                float diff = x[index] - mean[i];
                var_sum += diff * diff;
            }
        }
        variance[i] = var_sum * scale;
    }
}