#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate index using 1D grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float sum = 0.0f;
    int total_elements = batch * spatial;
    
    // Accumulate sum across batch and spatial dimensions
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index];
        }
    }
    
    // Write the mean value for filter i
    mean[i] = sum / total_elements;
}