#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MulWithScale_Kernel(float* in_out_put, const float scale, const int width, const int height, const int nChannels)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds once per thread
    if (x < width && y < height) {
        int offset = (y * width + x) * nChannels; // Calculate full offset including channels
        for (int c = 0; c < nChannels; c++) {
            in_out_put[offset + c] *= scale; // Multiply each channel element
        }
    }
}