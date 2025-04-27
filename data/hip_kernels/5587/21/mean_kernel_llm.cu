#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate a reciprocal to avoid repeated division.
    const float scale = 1.f / (batch * spatial);
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return early if out of bounds
    if (i >= filters) return;
    
    float sum = 0.0f; // Use a local variable for accumulation

    // Combine loops to improve data locality and reduce index calculations
    for (int j = 0; j < batch * spatial; ++j) {
        int index = j * filters + i;
        sum += x[index]; // Accumulate directly into local variable
    }
    
    mean[i] = sum * scale; // Assign once after multiplication
}