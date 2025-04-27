#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    float sum = 0.0f; // Accumulate result locally
    int index;

    // Loop unrolling for better performance
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) { // Stride by threads
            index = j*spatial*filters + filter*spatial + i;
            sum += delta[index] * (x[index] - mean[filter]);
        }
    }

    local[id] = sum;
    __syncthreads(); // Synchronize before reduction

    if (id == 0) {
        float total = 0.0f;
        for (int i = 0; i < threads; ++i) {
            total += local[i];
        }
        variance_delta[filter] = total * -.5f * powf(variance[filter] + .000001f, -1.5f);
    }
}