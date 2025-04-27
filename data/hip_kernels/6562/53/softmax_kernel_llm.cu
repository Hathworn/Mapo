#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
    // Use shared memory for optimization
    extern __shared__ float shared_mem[];
    float *shared_input = shared_mem;

    // Load input into shared memory
    int tid = threadIdx.x;
    if (tid < n) {
        shared_input[tid] = input[tid * stride];
    }
    __syncthreads();

    float sum = 0;
    float largest = -INFINITY;

    // Use parallel reduction to find the largest value
    for (int offset = 1; offset < n; offset *= 2) {
        if (tid % (2 * offset) == 0 && (tid + offset) < n) {
            shared_input[tid] = max(shared_input[tid], shared_input[tid + offset]);
        }
        __syncthreads();
    }

    if (tid == 0) {
        largest = shared_input[0];
    }
    __syncthreads();

    // Compute exponential values and sum
    if (tid < n) {
        float e = expf((shared_input[tid] - largest) / temp);
        shared_mem[tid] = e;
        atomicAdd(&sum, e);
    }
    __syncthreads();

    // Normalize the output
    if (tid < n) {
        output[tid * stride] = shared_mem[tid] / sum;
    }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= batch * groups) return;
    int b = id / groups;
    int g = id % groups;
    extern __shared__ float shared_mem[];
    int shared_mem_size = n * sizeof(float); // Adjust based on the 'n' size
    softmax_device(input + b*batch_offset + g*group_offset, n, temp, stride, output + b*batch_offset + g*group_offset, shared_mem, shared_mem_size);
}