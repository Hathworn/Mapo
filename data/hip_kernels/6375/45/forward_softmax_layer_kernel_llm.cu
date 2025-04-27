#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_softmax_layer_kernel(int n, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;
    if(b >= batch) return;

    extern __shared__ float buffer[]; // Shared memory for reduction
    float *shared_input = buffer;
    float *shared_exps = buffer + n;

    float sum = 0;
    float largest = -INFINITY;

    // Load and find the largest value
    for(int i = threadIdx.x; i < n; i += blockDim.x){
        shared_input[i] = input[i + b * n];
        atomicMax(&largest, shared_input[i]);
    }
    __syncthreads(); // Ensure all threads have loaded data

    // Compute exponentials and sum them up
    for(int i = threadIdx.x; i < n; i += blockDim.x){
        shared_exps[i] = expf((shared_input[i] - largest) / temp);
        atomicAdd(&sum, shared_exps[i]);
    }
    __syncthreads();

    sum = __syncthreads_or(sum); // Broadcast sum to all threads

    // Calculate final output
    for(int i = threadIdx.x; i < n; i += blockDim.x){
        output[i + b * n] = shared_exps[i] / sum;
    }
}