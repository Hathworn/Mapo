#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Declare shared memory for mean_delta
    extern __shared__ float shared_mean_delta[];

    shared_mean_delta[threadIdx.x] = 0;
    
    // Accumulate in shared memory
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
             int index = j * filters * spatial + i * spatial + k;
             shared_mean_delta[threadIdx.x] += delta[index];
        }
    }

    // Synchronize threads to ensure completion of shared memory operations
    __syncthreads();

    // Transfer results to global memory
    if (threadIdx.x == 0) {
        float block_sum = 0;
        for (int j = 0; j < blockDim.x; ++j) {
            block_sum += shared_mean_delta[j];
        }
        mean_delta[i] = block_sum * (-1.f / sqrtf(variance[i] + .00001f));
    }
}