#include "hip/hip_runtime.h"
#include "includes.h"

static void CheckCudaErrorAux (const char *, unsigned, const char *, hipError_t);
#define CUDA_CHECK_RETURN(value) CheckCudaErrorAux(__FILE__,__LINE__, #value, value)

__global__ void convolvePSF(int width, int height, int imageCount, short *image, short *results, float *psf, int psfRad, int psfDim)
{
    // Calculate global thread coordinates
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread coordinates are within image bounds
    if (x >= width || y >= height) return;

    // Calculate convolution boundaries
    const int minX = max(x - psfRad, 0);
    const int minY = max(y - psfRad, 0);
    const int maxX = min(x + psfRad + 1, width);
    const int maxY = min(y + psfRad + 1, height);
    const int dx = maxX - minX;
    const int dy = maxY - minY;

    // Shared memory for convolution area
    __shared__ float convArea[13][13];

    // Initialize sum and correction factors
    float sum = 0.0;
    int xCorrection = x - psfRad < 0 ? 0 : psfDim - dx;
    int yCorrection = y - psfRad < 0 ? 0 : psfDim - dy;

    // Load image segment into shared memory and calculate sum
    for (int i = 0; i < dx; ++i) {
        for (int j = 0; j < dy; ++j) {
            float value = float(image[0 * width * height + (minX + i) * height + minY + j]);
            sum += value;
            convArea[i][j] = value;
        }
    }

    // Calculate the sum of differences
    float sumDifference = 0.0;
    for (int i = 0; i < dx; ++i) {
        for (int j = 0; j < dy; ++j) {
            sumDifference += fabsf(convArea[i][j] / sum - psf[(i + xCorrection) * psfDim + j + yCorrection]);
        }
    }

    // Write result to the global memory
    results[0 * width * height + x * height + y] = int(1000.0 * sumDifference);
}