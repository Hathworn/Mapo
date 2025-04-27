#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate the global index for the thread
    int s = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (s >= size) return;

    // Initialize mean variable and use shared memory to reduce global memory accesses
    extern __shared__ float shared_mean[];
    shared_mean[threadIdx.x] = 0.0f;

    // Compute the mean of absolute values in parallel
    for (int i = 0; i < n; ++i){
        shared_mean[threadIdx.x] += fabsf(input[i * size + s]);
    }

    // Reduce the sum in shared memory to calculate the mean
    float mean = 0.0f;
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        __syncthreads();
        if (threadIdx.x < offset) {
            shared_mean[threadIdx.x] += shared_mean[threadIdx.x + offset];
        }
    }
    if (threadIdx.x == 0) {
        mean = shared_mean[0] / n;
        shared_mean[0] = mean;
    }

    // Broadcast the computed mean to all threads in the block
    __syncthreads();
    mean = shared_mean[0];

    // Binarize the input based on the computed mean
    for (int i = 0; i < n; ++i){
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}