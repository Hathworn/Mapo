#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gArgmax(float* out, const float* data, size_t rows, size_t cols) {
    // Calculate global thread index
    size_t row = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread operates within bounds
    if (row < rows) {
        size_t startInd = row * cols;
        float maxScore = -FLT_MAX;  // Use of FLT_MAX for better flexibility
        size_t maxInd = 0;

        // Iterate over columns to find max score and index
        for (size_t col = 0; col < cols; ++col) {
            size_t ind = startInd + col;
            float score = data[ind];
            if (score > maxScore) {
                maxScore = score;
                maxInd = col;
            }
        }
        out[row] = maxInd; // Store result in the output array
    }
}