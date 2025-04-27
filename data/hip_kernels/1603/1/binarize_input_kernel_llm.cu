#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (s >= size) return;

    // Use shared memory to reduce redundant global memory accesses
    extern __shared__ float shared_mean[];

    float mean = 0.0f;
    int i;

    // Calculate partial mean in each thread
    for (i = 0; i < n; ++i) {
        mean += fabsf(input[i * size + s]);
    }

    // Store mean in shared memory for further access
    shared_mean[threadIdx.x] = mean;

    // Synchronize all threads to ensure shared memory is fully populated
    __syncthreads();

    // Calculate global mean by accumulating shared memory values
    if (threadIdx.x == 0) {
        float total_mean = 0.0f;
        for (i = 0; i < blockDim.x; ++i) {
            total_mean += shared_mean[i];
        }
        mean = total_mean / (n * blockDim.x);
    }

    // Broadcast the calculated mean to all threads in the block
    __syncthreads();

    // Use the mean from shared memory
    if (threadIdx.x == 0) {
        shared_mean[0] = mean;
    }

    // Synchronize to ensure all threads have the correct mean value
    __syncthreads();

    // Binarize input using the shared mean
    for (i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? shared_mean[0] : -shared_mean[0];
    }
}