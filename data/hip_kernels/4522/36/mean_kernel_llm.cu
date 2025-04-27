#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.f/(batch * spatial);

    // Utilize blockIdx.x to compute the filter index directly.
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float sum = 0;
    
    // Combine loops to reduce computations
    int total = batch * spatial;
    for (int idx = 0; idx < total; ++idx) {
        int index = idx * filters + i;
        sum += x[index];
    }

    mean[i] = sum * scale;
}