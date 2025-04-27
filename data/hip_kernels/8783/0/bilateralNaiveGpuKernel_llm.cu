#include "hip/hip_runtime.h"
#include "includes.h"

const int BLOCKDIM = 16;

__device__ inline float gaussian(float x, float mu, float sigma)
{
    return expf(-((x - mu) * (x - mu)) / (2 * sigma * sigma)) / (2 * M_PI * sigma * sigma);
}

__device__ inline float distance(int x0, int y0, int x1, int y1)
{
    return sqrtf((x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1));
}

__global__ void bilateralNaiveGpuKernel(float* inputImage, float* outputImage, int rows, int cols, uint32_t window, float sigmaD, float sigmaR)
{
    float filteredPixel, neighbourPixel, currentPixel;
    float wP, gR, gD;
    int neighbourCol;
    int neighbourRow;
    
    const int col = blockIdx.x * blockDim.x + threadIdx.x;
    const int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds
    if (col >= cols || row >= rows) return;

    filteredPixel = 0;
    wP = 0;
    currentPixel = inputImage[col + row * cols]; // Precompute currentPixel
    
    for (int windowRow = -(window / 2); windowRow <= window / 2; ++windowRow)
    {
        for (int windowCol = -(window / 2); windowCol <= window / 2; ++windowCol)
        {
            neighbourCol = min(max(col + windowCol, 0), cols - 1);
            neighbourRow = min(max(row + windowRow, 0), rows - 1);

            neighbourPixel = inputImage[neighbourCol + neighbourRow * cols];

            // Intensity factor
            gR = gaussian(neighbourPixel - currentPixel, 0.0, sigmaR);
            // Distance factor
            gD = gaussian(distance(col, row, neighbourCol, neighbourRow), 0.0, sigmaD);

            float weight = gR * gD;
            filteredPixel += neighbourPixel * weight;
            wP += weight;
        }
    }
    if (wP > 0) // Prevent division by zero
        outputImage[col + row * cols] = filteredPixel / wP;
    else
        outputImage[col + row * cols] = currentPixel; // Preserve original pixel if no weights
}