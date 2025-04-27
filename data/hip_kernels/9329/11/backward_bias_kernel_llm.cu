#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Loop unrolling for improved performance
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK * 4) {
            int index1 = p + i + size * (filter + n * b);
            int index2 = index1 + BLOCK;
            int index3 = index1 + 2 * BLOCK;
            int index4 = index1 + 3 * BLOCK;
            if (p + i < size) sum += delta[index1];
            if (p + i + BLOCK < size) sum += delta[index2];
            if (p + i + 2 * BLOCK < size) sum += delta[index3];
            if (p + i + 3 * BLOCK < size) sum += delta[index4];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use a parallel reduction to accumulate the results
    if (BLOCK >= 512) { if (p < 256) part[p] += part[p + 256]; __syncthreads(); }
    if (BLOCK >= 256) { if (p < 128) part[p] += part[p + 128]; __syncthreads(); }
    if (BLOCK >= 128) { if (p < 64) part[p] += part[p + 64]; __syncthreads(); }

    if (p < 32) {
        // Warp reduction without syncthreads
        volatile float *vpart = part;
        if (BLOCK >= 64) vpart[p] += vpart[p + 32];
        if (BLOCK >= 32) vpart[p] += vpart[p + 16];
        if (BLOCK >= 16) vpart[p] += vpart[p + 8];
        if (BLOCK >= 8) vpart[p] += vpart[p + 4];
        if (BLOCK >= 4) vpart[p] += vpart[p + 2];
        if (BLOCK >= 2) vpart[p] += vpart[p + 1];
    }

    if (p == 0) bias_updates[filter] += part[0];
}