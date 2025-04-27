#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sharedMatmul(float *a, float *b, float *c, int n) {
    __shared__ float A_tile[32][32];
    __shared__ float B_tile[32][32];
    int width = gridDim.x * blockDim.x;

    float acc = 0;
    int i = blockIdx.x * 32 + threadIdx.x;
    int j = blockIdx.y * 32 + threadIdx.y;

    // Loop unrolling to improve performance
    for (int tileIdx = 0; tileIdx < gridDim.x; tileIdx++) {
        A_tile[threadIdx.y][threadIdx.x] = a[j * width + tileIdx * 32 + threadIdx.x];
        B_tile[threadIdx.y][threadIdx.x] = b[(tileIdx * 32 + threadIdx.y) * width + i];
        
        __syncthreads();

        // Use registers to accumulate result to reduce memory access latency
        #pragma unroll
        for (int k = 0; k < 32; k++) {
            acc += A_tile[threadIdx.y][k] * B_tile[k][threadIdx.x];
        }

        __syncthreads();
    }

    c[j * width + i] = acc;
}