#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

// Optimized kernel function
__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for larger data sets

    for (int i = index; i < N; i += stride) { // Use loop unrolling for better memory access
        int f = (i / spatial) % filters;
        x[i] = (x[i] - mean[f]) / (sqrt(variance[f]) + .000001f);
    }
}