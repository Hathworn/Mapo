#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution_global_memory_gray(unsigned char *N, float *M, unsigned char* g, std::size_t cols, std::size_t rows, std::size_t mask_size) {
    int paddingSize = (mask_size - 1) / 2;
    unsigned int paddedH = cols + 2 * paddingSize;
    unsigned int paddedW = rows + 2 * paddingSize;

    int i = blockIdx.x * blockDim.x + threadIdx.x + paddingSize;
    int j = blockIdx.y * blockDim.y + threadIdx.y + paddingSize;

    // Use shared memory for tile caching
    extern __shared__ unsigned char sharedMem[];
    int localIdx = threadIdx.y * blockDim.x + threadIdx.x;
    sharedMem[localIdx] = 0;

    if ((j >= paddingSize) && (j < paddedW - paddingSize) && (i >= paddingSize) && (i < paddedH - paddingSize)) {
        unsigned int oPixelPos = (j - paddingSize) * cols + (i - paddingSize);
        float sum = 0.0f;  // Use a local variable to accumulate results
      
        for (int k = -paddingSize; k <= paddingSize; k++) {
            for (int l = -paddingSize; l <= paddingSize; l++) {
                unsigned int iPixelPos = (j + l) * cols + (i + k);
                unsigned int coefPos = (k + paddingSize) * mask_size + (l + paddingSize);
                sum += N[iPixelPos] * M[coefPos];
            }
        }
        g[oPixelPos] = static_cast<unsigned char>(sum);  // Assign the accumulated result
    }
}