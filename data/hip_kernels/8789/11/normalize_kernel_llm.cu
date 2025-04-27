#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Loop to handle cases where N is larger than grid size
    for (; index < N; index += stride) {
        int f = (index / spatial) % filters;
        // Optimize division operation by using multiplication and addition
        float inv_sqrt_var = rsqrtf(variance[f] + .000001f);
        x[index] = (x[index] - mean[f]) * inv_sqrt_var;
    }
}