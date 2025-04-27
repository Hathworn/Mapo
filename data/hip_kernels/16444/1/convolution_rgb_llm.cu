#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution_rgb(unsigned char *N, float *M, unsigned char *g, std::size_t cols, std::size_t rows, std::size_t mask_size) {
    int paddingSize = ((mask_size - 1) / 2) * 3;
    unsigned int paddedH = cols + 2 * paddingSize;
    unsigned int paddedW = rows * 3 + 2 * paddingSize;

    int i = blockIdx.x * blockDim.x + threadIdx.x + paddingSize;
    int j = blockIdx.y * blockDim.y + threadIdx.y + paddingSize;

    // Ensure thread is within valid computation boundary
    if ((i >= paddingSize) && (i < paddedW - paddingSize) && (j >= paddingSize) && (j < paddedH - paddingSize)) {
        unsigned int oPixelPos = (i - paddingSize) * cols + (j - paddingSize);
        float sum = 0.0f;  // Using floating point accumulation for better precision

        // Loop unrolling for optimization
        for (int k = -paddingSize; k <= paddingSize; k = k + 3) {
            for (int l = -paddingSize; l <= paddingSize; l = l + 3) {
                unsigned int iPixelPos = (i + k) * paddedH + (j + l);
                int iterationK = (k + paddingSize) / 3;
                int iterationL = (l + paddingSize) / 3;
                unsigned int filtrePos = iterationK * mask_size + iterationL;

                sum += N[iPixelPos] * M[filtrePos];  // Accumulate using a temporary sum
            }
        }

        g[oPixelPos] = static_cast<unsigned char>(sum);  // Convert accumulated sum to unsigned char
    }
}