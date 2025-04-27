#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate the global thread index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Use shared memory to improve memory access efficiency
    extern __shared__ float shared_delta[];
    float sum = 0;

    for (int j = 0; j < batch; ++j) {
        for (int k = threadIdx.x; k < spatial; k += blockDim.x) {
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index];
        }
    }

    // Synchronize shared memory
    __syncthreads();

    // Reduce sum from shared memory
    atomicAdd(mean_delta + i, sum);

    // Normalize the result
    mean_delta[i] *= (-1.f / sqrtf(variance[i] + .00001f));
}