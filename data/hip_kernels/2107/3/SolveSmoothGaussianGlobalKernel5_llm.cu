#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SolveSmoothGaussianGlobalKernel5(float* u, float* v, float* bku, float* bkv, int width, int height, int stride, float *outputu, float *outputv, float *outputbku, float* outputbkv)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix >= width || iy >= height) return;

    const int pos = ix + iy * stride;
    float sumu = 0.0f;
    float sumv = 0.0f;

    __shared__ float w[25];
    if (threadIdx.x < 5 && threadIdx.y < 5) {
        const float local_w[25] = { 0.0037, 0.0147, 0.0256, 0.0147, 0.0037,
                                    0.0147, 0.0586, 0.0952, 0.0586, 0.0147,
                                    0.0256, 0.0952, 0.1502, 0.0952, 0.0256,
                                    0.0147, 0.0586, 0.0952, 0.0586, 0.0147,
                                    0.0037, 0.0147, 0.0256, 0.0147, 0.0037 };
        w[threadIdx.y * 5 + threadIdx.x] = local_w[threadIdx.y * 5 + threadIdx.x];
    }
    __syncthreads(); // Ensure all threads have loaded the weights

    for (int j = 0; j < 5; j++) {
        int row = iy + j - 2; // Precompute row index
        if (row >= 0 && row < height) { // Check the row boundary once
            for (int i = 0; i < 5; i++) {
                int col = ix + i - 2; // Precompute column index
                if (col >= 0 && col < width) { // Check boundary conditions
                    int idx = col + stride * row;
                    sumu += w[j * 5 + i] * u[idx];
                    sumv += w[j * 5 + i] * v[idx];
                }
            }
        }
    }

    outputu[pos] = sumu;
    outputv[pos] = sumv;
    outputbku[pos] = bku[pos] + u[pos] - sumu;
    outputbkv[pos] = bkv[pos] + v[pos] - sumv;
}