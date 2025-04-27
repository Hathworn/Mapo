#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Use shared memory for reduced global memory access
    extern __shared__ float shared_mem[];
    float *shared_mean = shared_mem;
    float *shared_variance = shared_mean + filters;

    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i >= filters) return;

    // Move mean and variance to shared memory
    shared_mean[threadIdx.x] = mean[i];
    shared_variance[threadIdx.x] = variance[i];
    __syncthreads();

    float sum = 0.0f; // Local accumulator for variance_delta

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            // Calculate sum
            sum += delta[index] * (x[index] - shared_mean[threadIdx.x]);
        }
    }

    // Final computation using shared variance
    variance_delta[i] = sum * (-0.5f * powf(shared_variance[threadIdx.x] + 0.000001f, -1.5f));
}