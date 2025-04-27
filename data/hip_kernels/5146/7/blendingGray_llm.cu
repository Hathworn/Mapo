#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blendingGray(uchar3 *input, uchar3 *input2, uchar3 *output, int width, int height, float coefficient) {
    // Calculate thread's row and column
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within image bounds
    if (x < width && y < height) {
        // Compute unique thread index
        int tid = y * width + x;

        // Calculate threshold index
        int prodfin = (int)(coefficient * (float)(width * height));

        // Conditional output assignment
        uchar3& targetPix = (tid <= prodfin) ? input[tid] : input2[tid];
        output[tid].x = targetPix.x;
        output[tid].y = output[tid].z = output[tid].x;
    }
}