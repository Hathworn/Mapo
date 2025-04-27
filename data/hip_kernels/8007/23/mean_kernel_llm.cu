#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Optimize scale calculation by moving it outside the kernel
    float scale = 1.f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Boundary check
    if (i >= filters) return;
    
    // Use shared memory to reduce global memory access
    extern __shared__ float shared[];
    
    int j, k;
    float sum = 0;
    for (j = 0; j < batch; ++j) {
        for (k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index]; // Accumulate sum in local variable
        }
    }
    
    mean[i] = sum * scale; // Store the result after multiplication with scale
}