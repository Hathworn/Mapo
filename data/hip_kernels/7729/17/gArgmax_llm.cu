#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gArgmax(float* out, const float* data, size_t rows, size_t cols) {
    size_t row = blockIdx.x * blockDim.x + threadIdx.x;
    if (row >= rows) return;  // Ensure thread accesses within bounds

    size_t startInd = row * cols;
    float maxScore = -FLT_MAX;  // Use FLT_MAX for better readability
    size_t maxInd = 0;  // Initialize maxInd correctly

    // Unroll loop to improve performance
    for (size_t col = 0; col < cols; col += 4) {
        size_t ind = startInd + col;
        
        float score = (col < cols) ? data[ind] : -FLT_MAX;
        if (score > maxScore) {
            maxScore = score;
            maxInd = col;
        }
        
        if (col + 1 < cols) {
            score = data[ind + 1];
            if (score > maxScore) {
                maxScore = score;
                maxInd = col + 1;
            }
        }
        
        if (col + 2 < cols) {
            score = data[ind + 2];
            if (score > maxScore) {
                maxScore = score;
                maxInd = col + 2;
            }
        }
        
        if (col + 3 < cols) {
            score = data[ind + 3];
            if (score > maxScore) {
                maxScore = score;
                maxInd = col + 3;
            }
        }
    }
    out[row] = maxInd;
}