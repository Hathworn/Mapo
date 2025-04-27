#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Use shared memory for faster access to frequently used data
    extern __shared__ float shared_mean_variance[];
    float *shared_mean = shared_mean_variance;
    float *shared_variance = shared_mean_variance + filters;

    int filterIdx = threadIdx.x;
    if (filterIdx < filters) {
        shared_mean[filterIdx] = mean[filterIdx];
        shared_variance[filterIdx] = variance[filterIdx];
    }
    __syncthreads();

    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float temp_variance_delta = 0;
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            temp_variance_delta += delta[index] * (x[index] - shared_mean[i]);
        }
    }

    variance_delta[i] = temp_variance_delta * -.5f * powf(shared_variance[i] + .00001f, (float)(-3.f / 2.f));
}