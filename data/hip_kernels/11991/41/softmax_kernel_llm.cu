#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    extern __shared__ float shared_data[]; // Use shared memory
    float sum = 0.0f;
    float largest = -INFINITY;

    // Use one loop with parallel reduction to find largest
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i];
        atomicMax(&largest, val); // Use atomic operation to find largest in parallel
    }
    __syncthreads();

    // Compute exponentials and sum them up
    float partial_sum = 0.0f;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float e = exp((input[i] - largest) / temp);
        partial_sum += e;
        output[i] = e;
    }
    shared_data[threadIdx.x] = partial_sum; // Store partial sum in shared memory
    __syncthreads();

    // Reduce partial sums into total sum
    if (threadIdx.x == 0) {
        for (int i = 1; i < blockDim.x; ++i) {
            sum += shared_data[i];
        }
        sum += shared_data[0]; // Add the first element
    }
    __syncthreads();

    // Normalize output
    float norm_factor = sum; // Ensures the entire block sees the sum
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        output[i] /= norm_factor;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x; // Simplify grid index calculation
    if (b >= batch) return;
    softmax_device(n, input + b * offset, temp, output + b * offset);
}