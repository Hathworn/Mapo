```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Combine blockIdx.y and gridDim.x with blockIdx.x for 1D grid
    if (i >= filters) return;
    
    float sum = 0.0f; // Use local variable for accumulation
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index]; // Accumulate in local memory
        }
    }
    mean[i] = sum * scale; // Set the mean after accumulation
}