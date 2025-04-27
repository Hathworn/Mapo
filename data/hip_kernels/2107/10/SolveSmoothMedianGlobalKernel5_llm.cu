#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SolveSmoothMedianGlobalKernel5(float* u, float* v, float* bku, float* bkv, int width, int height, int stride, float *outputu, float *outputv, float *outputbku, float* outputbkv)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    const int pos = ix + iy * stride;

    if (ix >= width || iy >= height) return;

    float mu[25] = { 0.0f };
    float mv[25] = { 0.0f };

    #pragma unroll
    for (int j = 0; j < 5; j++) {
        #pragma unroll
        for (int i = 0; i < 5; i++) {
            int col = ix + i - 2;
            int row = iy + j - 2;
            int clamped_col = min(max(col, 0), width - 1);
            int clamped_row = min(max(row, 0), height - 1);

            mu[j * 5 + i] = u[clamped_col + stride * clamped_row];
            mv[j * 5 + i] = v[clamped_col + stride * clamped_row];
        }
    }

    // Optimize sorting using insertion sort for small array
    float tmpu, tmpv;
    #pragma unroll
    for (int j = 1; j < 25; j++) {
        tmpu = mu[j];
        tmpv = mv[j];
        int i = j - 1;
        while (i >= 0 && mu[i] > tmpu) {
            mu[i + 1] = mu[i];
            i--;
        }
        mu[i + 1] = tmpu;

        i = j - 1;
        while (i >= 0 && mv[i] > tmpv) {
            mv[i + 1] = mv[i];
            i--;
        }
        mv[i + 1] = tmpv;
    }

    outputu[pos] = mu[12];
    outputv[pos] = mv[12];
    outputbku[pos] = bku[pos] + u[pos] - mu[12];
    outputbkv[pos] = bkv[pos] + v[pos] - mv[12];
}