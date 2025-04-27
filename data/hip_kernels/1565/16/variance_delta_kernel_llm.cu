#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Use shared memory for reduction within a block
    extern __shared__ float shared_variance_delta[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    shared_variance_delta[threadIdx.x] = 0;
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j*filters*spatial + i*spatial + k;
            shared_variance_delta[threadIdx.x] += delta[index] * (x[index] - mean[i]);
        }
    }
    
    // Synchronize threads within block for shared memory reduction
    __syncthreads();
    
    // Perform reduction using shared memory
    if (threadIdx.x == 0) {
        float block_sum = 0;
        for (int t = 0; t < blockDim.x; ++t) {
            block_sum += shared_variance_delta[t];
        }
        atomicAdd(&variance_delta[i], block_sum * -.5f * powf(variance[i] + .00001f, (float)(-3.f/2.f)));
    }
}