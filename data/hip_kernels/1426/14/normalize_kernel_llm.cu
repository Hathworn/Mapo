#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for all threads

    for (int i = index; i < N; i += stride) // Use loop to handle more elements with fewer blocks
    {
        int f = (i / spatial) % filters;
        x[i] = (x[i] - mean[f]) / (sqrtf(variance[f] + 0.00001f));
    }
}