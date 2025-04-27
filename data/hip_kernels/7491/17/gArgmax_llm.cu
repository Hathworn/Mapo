#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gArgmax(float* out, const float* data, size_t rows, size_t cols) {
    size_t row = blockIdx.x;
    size_t startInd = row * cols;
    float maxScore = -99999;
    size_t maxInd;

    // Use shared memory to improve memory access efficiency
    extern __shared__ float sharedData[];
    size_t tid = threadIdx.x;

    if (tid < cols) {
        sharedData[tid] = data[startInd + tid];
    }
    __syncthreads();

    for (size_t col = 0; col < cols; ++col) {
        float score = sharedData[col];
        if (score > maxScore) {
            maxScore = score;
            maxInd = col;
        }
    }

    out[row] = maxInd;
}