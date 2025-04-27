#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index < N) { // Inverted condition to reduce branching
        int f = (index / spatial) % filters;
        x[index] = (x[index] - mean[f]) / __fsqrt_rn(variance[f] + .00001f); // Use intrinsic function for faster sqrt
    }
}