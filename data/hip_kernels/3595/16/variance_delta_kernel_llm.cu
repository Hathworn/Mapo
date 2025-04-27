```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float temp_variance = -.5f * powf(variance[i] + .00001f, (float)(-3.f/2.f));
    float sum = 0;

    // Optimize memory access by using a single loop
    for (int j = 0; j < batch * spatial; ++j) {
        int index = j * filters + i;
        sum += delta[index] * (x[index] - mean[i]);
    }

    variance_delta[i] = sum * temp_variance;
}