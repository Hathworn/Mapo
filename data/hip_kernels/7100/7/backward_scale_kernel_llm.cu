#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Unroll the loop for better performance
    for (int b = 0; b < batch; ++b){
        for (int i = p; i < size; i += BLOCK){
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use parallel reduction for better performance
    if (BLOCK >= 1024 && p < 512) { part[p] += part[p + 512]; __syncthreads(); }
    if (BLOCK >= 512 && p < 256) { part[p] += part[p + 256]; __syncthreads(); }
    if (BLOCK >= 256 && p < 128) { part[p] += part[p + 128]; __syncthreads(); }
    if (BLOCK >= 128 && p < 64) { part[p] += part[p + 64]; __syncthreads(); }
    if (p < 32) {
        if (BLOCK >= 64) part[p] += part[p + 32];
        if (BLOCK >= 32) part[p] += part[p + 16];
        if (BLOCK >= 16) part[p] += part[p + 8];
        if (BLOCK >= 8) part[p] += part[p + 4];
        if (BLOCK >= 4) part[p] += part[p + 2];
        if (BLOCK >= 2) part[p] += part[p + 1];
    }

    // Final update to scale_updates
    if (p == 0) {
        scale_updates[filter] += part[0];
    }
}