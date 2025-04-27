#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK 1024 // Define BLOCK size

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Perform computation to reduce global memory accesses
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            sum += delta[i + size * (filter + n * b)];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Reduce within shared memory for final result
    if (BLOCK >= 1024 && p < 512) { part[p] += part[p + 512]; } __syncthreads();
    if (BLOCK >= 512 && p < 256) { part[p] += part[p + 256]; } __syncthreads();
    if (BLOCK >= 256 && p < 128) { part[p] += part[p + 128]; } __syncthreads();
    if (BLOCK >= 128 && p < 64) { part[p] += part[p + 64]; } __syncthreads();
    if (p < 32) {
        volatile float* vpart = part; // Use volatile to prevent compiler optimizations
        vpart[p] += vpart[p + 32]; 
        vpart[p] += vpart[p + 16]; 
        vpart[p] += vpart[p + 8]; 
        vpart[p] += vpart[p + 4];
        vpart[p] += vpart[p + 2];
        vpart[p] += vpart[p + 1];
    }

    if (p == 0) {
        bias_updates[filter] += part[0];
    }
}