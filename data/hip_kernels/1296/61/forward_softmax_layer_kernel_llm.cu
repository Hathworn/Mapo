#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_softmax_layer_kernel(int n, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if(b >= batch) return;

    float sum = 0;
    float largest = -INFINITY;

    // Use shared memory to reduce global memory access
    extern __shared__ float shared_mem[];
    float *shared_input = shared_mem;
    float *shared_output = shared_input + n * blockDim.x;

    // Load inputs to shared memory
    for(int i = threadIdx.x; i < n; i += blockDim.x) {
        shared_input[i] = input[i + b * n];
    }
    __syncthreads();

    // Find the largest element
    for(int i = 0; i < n; ++i) {
        largest = max(largest, shared_input[i]);
    }
    __syncthreads();

    // Compute the exponential values and the sum
    for(int i = 0; i < n; ++i) {
        shared_output[i] = exp((shared_input[i] - largest) / temp);
        sum += shared_output[i];
    }
    __syncthreads();

    // Normalize the output
    for(int i = 0; i < n; ++i) {
        output[i + b * n] = shared_output[i] / sum;
    }
}