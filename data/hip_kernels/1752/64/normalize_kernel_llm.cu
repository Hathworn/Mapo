```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial) {
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; // Optimize indexing calculation
    if (index < N) {
        int f = (index / spatial) % filters; // Calculate filter index
        float var = variance[f] + 1e-5f; // Pre-compute variance term
        x[index] = (x[index] - mean[f]) / sqrtf(var); // Normalize
    }
}