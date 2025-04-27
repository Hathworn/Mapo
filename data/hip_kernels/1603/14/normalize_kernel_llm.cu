#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index < N) { // Simplified boundary check
        int f = (index / spatial) % filters;
        float mean_f = mean[f];
        float variance_f = variance[f];
        float x_value = x[index];

        // Pre-compute and reuse mean_f and variance_f
        x[index] = (x_value - mean_f) / (sqrtf(variance_f + 1e-5f)); // Adjusted epsilon notation for clarity
    }
}