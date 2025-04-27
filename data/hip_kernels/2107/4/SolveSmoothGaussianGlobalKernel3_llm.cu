```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SolveSmoothGaussianGlobalKernel3(float* u, float* v, float* bku, float* bkv, int width, int height, int stride, float* outputu, float* outputv, float* outputbku, float* outputbkv)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;
    const int pos = ix + iy * stride;

    if (ix >= width || iy >= height) return;
    
    // Preload weights into shared memory for faster access
    __shared__ float w[9];
    if (threadIdx.x < 9) {
        w[threadIdx.x] = (threadIdx.x == 1 || threadIdx.x == 3 || threadIdx.x == 5 || threadIdx.x == 7) ? 0.1667f : (threadIdx.x == 4) ? 0.3333f : 0.0f;
    }
    __syncthreads();

    float sumu = 0.0f;
    float sumv = 0.0f;

    // Unrolling loops for better performance
#pragma unroll
    for (int j = -1; j <= 1; j++) {
#pragma unroll
        for (int i = -1; i <= 1; i++) {
            int col = ix + i;
            int row = iy + j;
            if (col >= 0 && col < width && row >= 0 && row < height) {
                int index = (j + 1) * 3 + (i + 1);
                sumu += w[index] * u[col + stride * row];
                sumv += w[index] * v[col + stride * row];
            }
        }
    }
    outputu[pos] = sumu;
    outputv[pos] = sumv;
    outputbku[pos] = bku[pos] + u[pos] - sumu;
    outputbkv[pos] = bkv[pos] + v[pos] - sumv;
}