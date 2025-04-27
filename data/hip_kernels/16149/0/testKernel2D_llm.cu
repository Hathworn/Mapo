#include "hip/hip_runtime.h"
#include "includes.h"

const int width = 567;
const int height = 985;

__global__ void testKernel2D(float* M, float* N, float* P, size_t pitch) {
    // Calculate col and row using threadIdx and blockIdx
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensures thread operates within bounds
    if (row < height && col < width) {
        float* row_M = (float*)((char*)M + row * pitch);
        float* row_N = (float*)((char*)N + row * pitch);
        float* row_P = (float*)((char*)P + row * pitch);

        // Perform element-wise addition
        row_P[col] = row_M[col] + row_N[col];
    }
}