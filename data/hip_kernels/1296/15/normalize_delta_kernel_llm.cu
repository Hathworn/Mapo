#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to store variance and mean values per filter
    __shared__ float shared_variance[blockDim.x];
    __shared__ float shared_mean[blockDim.x];

    if (threadIdx.x < filters) {
        shared_variance[threadIdx.x] = variance[threadIdx.x];
        shared_mean[threadIdx.x] = mean[threadIdx.x];
    }
    __syncthreads();

    if (index >= N) return;

    int f = (index / spatial) % filters;

    // Use shared memory value instead of global for improved performance
    float var_f = shared_variance[f];
    float mean_f = shared_mean[f];

    delta[index] = delta[index] * __frsqrt_rn(var_f + .00001f) + variance_delta[f] * 2.f * (x[index] - mean_f) / (spatial * batch) + mean_delta[f] / (spatial * batch);
}