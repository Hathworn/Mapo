#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;
    
    // Use shared memory for improved performance
    __shared__ float shared_mean;
    float local_sum = 0;

    // Calculate mean using shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        local_sum += fabsf(weights[f * size + i]);
    }

    // Reduce sum across threads
    atomicAdd(&shared_mean, local_sum);

    // Synchronize threads to ensure mean calculation is complete
    __syncthreads();

    if (threadIdx.x == 0) {
        shared_mean = shared_mean / size;
    }

    __syncthreads();

    // Binarize weights using the calculated mean
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? shared_mean : -shared_mean;
    }
}