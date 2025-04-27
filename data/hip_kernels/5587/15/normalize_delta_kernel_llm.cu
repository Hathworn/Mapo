#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for variance_delta and mean to reduce global memory accesses
    __shared__ float shared_variance_delta;
    __shared__ float shared_mean;
    
    if (index < N) {
        int f = (index/spatial) % filters;

        // load variance_delta and mean into shared memory for faster access
        if (threadIdx.x == 0) {
            shared_variance_delta = variance_delta[f];
            shared_mean = mean[f];
        }
        __syncthreads();

        // Perform computation with cached shared values
        float norm_variance = 1.f / (sqrtf(variance[f] + 0.00001f));
        delta[index] = delta[index] * norm_variance +
                       shared_variance_delta * 2.f * (x[index] - shared_mean) / (spatial * batch) +
                       mean_delta[f] / (spatial * batch);
    }
}