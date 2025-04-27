#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Optimize by unrolling the loop over i
    for (int b = 0; b < batch; ++b){
        for (int i = 0; i < size; i += BLOCK){
            int index = p + i + size * (filter + n * b);
            if (p + i < size) {
                // Use coalesced memory access
                sum += delta[index];
            }
        }
    }
    part[p] = sum;
    __syncthreads();

    // Parallel reduction for efficiency
    if (threadIdx.x < BLOCK / 2) {
        part[threadIdx.x] += part[threadIdx.x + BLOCK / 2];
    }
    __syncthreads();

    if (threadIdx.x < BLOCK / 4) {
        part[threadIdx.x] += part[threadIdx.x + BLOCK / 4];
    }
    __syncthreads();

    if (threadIdx.x < BLOCK / 8) {
        part[threadIdx.x] += part[threadIdx.x + BLOCK / 8];
    }
    __syncthreads();

    if (threadIdx.x < BLOCK / 16) {
        part[threadIdx.x] += part[threadIdx.x + BLOCK / 16];
    }
    __syncthreads();

    if (threadIdx.x == 0) {
        for (int i = 0; i < BLOCK / 32; ++i) {
            bias_updates[filter] += part[i];
        }
    }
}