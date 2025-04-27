#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Compute the thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize shared memory for variance_delta
    __shared__ float shared_variance_delta[1024];  // Assuming a block size limit for optimization
    shared_variance_delta[threadIdx.x] = 0;

    // Main loop over batch and spatial dimensions
    for (int j = 0; j < batch; ++j)
    {
        for (int k = 0; k < spatial; ++k)
        {
            int index = j * filters * spatial + i * spatial + k;
            shared_variance_delta[threadIdx.x] += delta[index] * (x[index] - mean[i]);
        }
    }

    // Store the weighted variance delta in shared memory
    shared_variance_delta[threadIdx.x] *= -.5f * powf(variance[i] + .000001f, -1.5f);

    // Write final result from shared memory back to global memory
    variance_delta[i] = shared_variance_delta[threadIdx.x];
}