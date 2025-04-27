#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Compute mean using shared memory
    extern __shared__ float shared_input[];

    float local_mean = 0;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        shared_input[threadIdx.x] = fabs(input[i * size + s]);
        local_mean += shared_input[threadIdx.x];
    }

    // Reduce sum in shared memory
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1) {
        __syncthreads();  // Synchronization barrier
        if (threadIdx.x < offset) {
            shared_input[threadIdx.x] += shared_input[threadIdx.x + offset];
        }
    }

    // Mean computation using the sum stored in shared memory
    __syncthreads();  // Ensure all threads are done computing
    local_mean = shared_input[0];
    local_mean /= n;

    // Binarize input based on computed mean
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? local_mean : -local_mean;
    }
}