#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TgvMedianFilterKernel3(float* u, float* v, int width, int height, int stride, float *outputu, float *outputv)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;
    const int pos = ix + iy * stride;

    if (ix >= width || iy >= height) return;

    float mu[9], mv[9];

    #pragma unroll
    for (int j = 0; j < 3; j++) {
        #pragma unroll
        for (int i = 0; i < 3; i++) {
            int col = ix + i - 1;
            int row = iy + j - 1;
            int index = j * 3 + i;
            
            // Load boundary conditions
            if ((col >= 0) && (col < width) && (row >= 0) && (row < height)) {
                mu[index] = u[col + stride * row];
                mv[index] = v[col + stride * row];
            } else {
                mu[index] = (col < 0) ? u[stride * row] : (col >= width) ? u[width - 1 + stride * row] : (row < 0) ? u[col] : u[col + stride * (height - 1)];
                mv[index] = (col < 0) ? v[stride * row] : (col >= width) ? v[width - 1 + stride * row] : (row < 0) ? v[col] : v[col + stride * (height - 1)];
            }
        }
    }

    // Insertion sort to find median
    #pragma unroll
    for (int j = 0; j < 9; j++) {
        #pragma unroll
        for (int i = j + 1; i < 9; i++) {
            if (mu[j] > mu[i]) {
                float tmp = mu[j];
                mu[j] = mu[i];
                mu[i] = tmp;
            }
            if (mv[j] > mv[i]) {
                float tmp = mv[j];
                mv[j] = mv[i];
                mv[i] = tmp;
            }
        }
    }

    outputu[pos] = mu[4];
    outputv[pos] = mv[4];
}