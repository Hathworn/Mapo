#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Flatten blockIdx and threadIdx for a 1D grid
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid
    for (; index < N; index += stride) { // Loop over data with step size equal to stride
        int f = (index / spatial) % filters; // Calculate filter index
        x[index] = (x[index] - mean[f]) / (sqrtf(variance[f] + .00001f)); // Normalize input
    }
}