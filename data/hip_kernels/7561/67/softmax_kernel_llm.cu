#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(int n, float *input, float temp, float *output)
{
    float sum = 0;
    float largest = -INFINITY;
    // Use shared memory to cache input values for better performance
    extern __shared__ float shared_input[];
    
    int tid = threadIdx.x;
    if (tid < n) {
        shared_input[tid] = input[tid];
        __syncthreads();
        
        // Calculate the largest in parallel
        atomicMax(&largest, shared_input[tid]);
        __syncthreads();
        
        float e = exp(shared_input[tid] / temp - largest / temp);
        
        // Use atomic operations to calculate the sum in parallel
        atomicAdd(&sum, e);
        __syncthreads();
        
        output[tid] = e / sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if(b >= batch) return;
    
    // Launch with dynamic shared memory allocation
    softmax_device<<<1, n, n * sizeof(float)>>>(n, input + b * offset, temp, output + b * offset);
}