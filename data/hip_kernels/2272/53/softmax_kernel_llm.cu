```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    int i;
    float sum = 0;
    float largest = -INFINITY;

    // Use shared memory to avoid redundant global memory accesses
    extern __shared__ float temp_storage[];
    
    // Load data into shared memory
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        temp_storage[i * stride] = input[i * stride];
        atomicMax((int*)&largest, __float_as_int(temp_storage[i * stride]));
    }
    __syncthreads();

    // Calculate exponentials and sum in shared memory
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        float e = expf((temp_storage[i * stride] - largest) / temp);
        atomicAdd(&sum, e);
        temp_storage[i * stride] = e;
    }
    __syncthreads();

    // Normalize the output
    for (i = threadIdx.x; i < n; i += blockDim.x) {
        output[i * stride] = temp_storage[i * stride] / sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;
    
    int b = id / groups;
    int g = id % groups;   

    // Launch the optimized device function
    softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}