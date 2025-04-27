#include "hip/hip_runtime.h"
#include "includes.h"

__device__ bool between(int value, int lowerBound, int upperBound)
{
    return (value >= lowerBound && value <= upperBound);
}

__device__ void getTopLeft(float x, int width, int& point, float& weight)
{
    float xcoord = (x + 1) * (width - 1) / 2;
    point = floor(xcoord);
    weight = 1 - (xcoord - point);
}

__global__ void bilinearSamplingFromGrid(float* inputImages_data, int inputImages_strideBatch, int inputImages_strideChannels, int inputImages_strideHeight, int inputImages_strideWidth, float* grids_data, int grids_strideBatch, int grids_strideYX, int grids_strideHeight, int grids_strideWidth, float* output_data, int output_strideBatch, int output_strideChannels, int output_strideHeight, int output_strideWidth, int inputImages_channels, int inputImages_height, int inputImages_width, int output_width)
{
    const int xOut = blockIdx.x * blockDim.y + threadIdx.y;
    const bool withinImageBounds = xOut < output_width;
    const bool withinGridBounds = blockIdx.x * blockDim.y + threadIdx.x / 2 < output_width;
    const int yOut = blockIdx.y;
    const int width = inputImages_width;
    const int height = inputImages_height;
    const int b = blockIdx.z;

    float yf, xf;

    __shared__ float gridData[32];
    
    if (threadIdx.y == 0 && withinGridBounds) {
        gridData[threadIdx.x] = grids_data[b * grids_strideBatch + yOut * grids_strideHeight + xOut * grids_strideWidth + threadIdx.x];
    }
    
    // Synchronize threads to ensure all grid data is loaded
    __syncthreads();
    
    if (!withinImageBounds) return;

    // Load grid coordinates
    yf = gridData[threadIdx.y * 2];
    xf = gridData[threadIdx.y * 2 + 1];

    int yInTopLeft, xInTopLeft;
    float yWeightTopLeft, xWeightTopLeft;
    getTopLeft(xf, inputImages_width, xInTopLeft, xWeightTopLeft);
    getTopLeft(yf, inputImages_height, yInTopLeft, yWeightTopLeft);

    const int outAddress = output_strideBatch * b + output_strideHeight * yOut + output_strideWidth * xOut;

    // Calculate base input addresses
    const int inTopLeftAddress = inputImages_strideBatch * b + inputImages_strideHeight * yInTopLeft + inputImages_strideWidth * xInTopLeft;
    const int inTopRightAddress = inTopLeftAddress + inputImages_strideWidth;
    const int inBottomLeftAddress = inTopLeftAddress + inputImages_strideHeight;
    const int inBottomRightAddress = inBottomLeftAddress + inputImages_strideWidth;

    // Pre-compute boolean checks for boundary conditions
    bool topLeftIsIn = between(xInTopLeft, 0, width - 1) && between(yInTopLeft, 0, height - 1);
    bool topRightIsIn = between(xInTopLeft + 1, 0, width - 1) && between(yInTopLeft, 0, height - 1);
    bool bottomLeftIsIn = between(xInTopLeft, 0, width - 1) && between(yInTopLeft + 1, 0, height - 1);
    bool bottomRightIsIn = between(xInTopLeft + 1, 0, width - 1) && between(yInTopLeft + 1, 0, height - 1);

    // Interpolation
    for (int t = threadIdx.x; t < inputImages_channels; t += blockDim.x) {
        float v = 0.0f;
        float inTopLeft = topLeftIsIn ? inputImages_data[inTopLeftAddress + t] : 0.0f;
        float inTopRight = topRightIsIn ? inputImages_data[inTopRightAddress + t] : 0.0f;
        float inBottomLeft = bottomLeftIsIn ? inputImages_data[inBottomLeftAddress + t] : 0.0f;
        float inBottomRight = bottomRightIsIn ? inputImages_data[inBottomRightAddress + t] : 0.0f;

        // Weighted interpolation
        v = xWeightTopLeft * yWeightTopLeft * inTopLeft
          + (1 - xWeightTopLeft) * yWeightTopLeft * inTopRight
          + xWeightTopLeft * (1 - yWeightTopLeft) * inBottomLeft
          + (1 - xWeightTopLeft) * (1 - yWeightTopLeft) * inBottomRight;

        output_data[outAddress + t] = v;
    }
}