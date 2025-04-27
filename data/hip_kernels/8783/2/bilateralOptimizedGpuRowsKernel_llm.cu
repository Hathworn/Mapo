#include "hip/hip_runtime.h"
#include "includes.h"

const int BLOCKDIM = 16;

/**
* @brief      Calculates the Euclidean distance between two points (x0, y0) and
*             (x1, y1)
*
* @param[in]  x0    The x0 coordinate
* @param[in]  y0    The y0 coordinate
* @param[in]  x1    The x1 coordinate
* @param[in]  y1    The y1 coordinate
*
* @return     The distance between the two points
*/
__device__ inline float gaussian(float x, float mu, float sigma)
{
    return static_cast<float>(expf(-((x - mu) * (x - mu))/(2 * sigma * sigma)) / (2 * M_PI * sigma * sigma));
}

__device__ inline float distance(int x0, int y0, int x1, int y1)
{
    return static_cast<float>(sqrtf((x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1)));
}

__global__ void bilateralOptimizedGpuRowsKernel( float* __restrict__ inputImage, float* __restrict__ outputImage, int rows, int cols, uint32_t window, float sigmaD, float sigmaR)
{
    float filteredPixel = 0, wP = 0;
    const int col = blockIdx.x * blockDim.x + threadIdx.x;
    const int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (col >= cols || row >= rows) return;

    // Cache currentPixel and use shared memory for neighbour pixels if possible
    float currentPixel = inputImage[col + row * cols];

    #pragma unroll
    for (int windowRow = 0; windowRow < window; windowRow++)
    {
        int neighbourRow = row - (window / 2) - windowRow;
        neighbourRow = max(neighbourRow, 0); // Ensure neighbourRow is within bounds

        float neighbourPixel = inputImage[col + neighbourRow * cols];

        float gR = gaussian(neighbourPixel - currentPixel, 0.0f, sigmaR);
        float gD = gaussian(distance(col, row, col, neighbourRow), 0.0f, sigmaD);

        filteredPixel += neighbourPixel * (gR * gD);
        wP += (gR * gD);
    }

    outputImage[col + row * cols] = filteredPixel / wP;
}