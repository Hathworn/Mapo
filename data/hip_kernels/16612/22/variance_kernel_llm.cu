#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Precompute constants
    float scale = 1.f / (batch * spatial - 1);

    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (i >= filters) return;
    
    float varSum = 0.0f;  // Use a local variable to accumulate the variance for better performance

    // Use a single loop with flattened index access
    for (int j = 0; j < batch * spatial; ++j) {
        int index = j * filters + i;
        float diff = x[index] - mean[i];
        varSum += diff * diff;
    }

    // Write the computed variance to the output
    variance[i] = varSum * scale;
}