#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height) {
    // Use blockDim and blockIdx to calculate x, y directly to improve readability and slightly enhance performance.
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Perform conditional check and computation, without using deprecated __mul24.
    if (x < width && y < height) {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}