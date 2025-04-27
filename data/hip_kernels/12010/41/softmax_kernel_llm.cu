#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    extern __shared__ float shared_input[];
    int tid = threadIdx.x;
    float sum = 0;
    float largest = -INFINITY;

    // Load data to shared memory
    if (tid < n) {
        shared_input[tid] = input[tid];
    }
    __syncthreads();

    // Find largest element
    for (int i = tid; i < n; i += blockDim.x) {
        float val = shared_input[i];
        largest = (val > largest) ? val : largest;
    }

    // Synchronize threads before proceeding
    __syncthreads();

    // Calculate exponentials and sum
    for (int i = tid; i < n; i += blockDim.x) {
        float e = exp((shared_input[i] - largest) / temp);
        sum += e;
        shared_input[i] = e;  // update shared memory
    }
    __syncthreads();

    // Normalize the output
    for (int i = tid; i < n; i += blockDim.x) {
        output[i] = shared_input[i] / sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (b >= batch) return;

    // Execute softmax_device with shared memory
    extern __shared__ float shared_input[];
    softmax_device(n, input + b * offset, temp, output + b * offset);
}
```
