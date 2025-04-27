#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize mean_delta to zero using shared memory for faster access
    __shared__ float shared_mean_delta;
    if (threadIdx.x == 0) shared_mean_delta = 0;
    __syncthreads();
    
    // Use atomicAdd to avoid race conditions while updating shared memory
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            atomicAdd(&shared_mean_delta, delta[index]);
        }
    }
    
    // Finalize mean_delta computation after all threads are done updating shared_mean_delta
    if (threadIdx.x == 0) {
        mean_delta[i] = shared_mean_delta * (-1.F/sqrtf(variance[i] + .000001f));
    }
}