#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    extern __shared__ float shared_memory[]; // Utilize shared memory
    float *e_vals = shared_memory;
    float sum = 0.0f;
    float largest = -INFINITY;

    // Find largest value in a single loop
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float val = input[i];
        atomicMax((int*)&largest, __float_as_int(val)); // Compute largest in parallel
    }
    __syncthreads();

    // Compute exponentials and their sum
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float e = expf((input[i] - largest) / temp);
        e_vals[i] = e; // Store exponentials in shared memory
        atomicAdd(&sum, e);
    }
    __syncthreads();

    // Normalize output values
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        output[i] = e_vals[i] / sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if (b >= batch) return;
    softmax_device(n, input + b * offset, temp, output + b * offset);
}