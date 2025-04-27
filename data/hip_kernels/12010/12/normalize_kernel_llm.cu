#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of global index
    if (index < N) {
        int f = (index / spatial) % filters; // Calculate filter index
        float m = mean[f]; // Load mean into register
        float v = variance[f]; // Load variance into register

        // Normalize x[index]
        x[index] = (x[index] - m) / (sqrt(v) + 0.000001f);
    }
}