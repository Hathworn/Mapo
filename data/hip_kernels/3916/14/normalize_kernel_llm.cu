#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x; // Calculate total stride for grid

    for (int i = index; i < N; i += gridStride) { // Loop over grid with stride
        int f = (i / spatial) % filters;
        x[i] = (x[i] - mean[f]) / (sqrtf(variance[f] + .00001f));
    }
}