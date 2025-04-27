```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LowPassRowMulti(float *d_Result, float *d_Data, int width, int pitch, int height) {
    __shared__ float data[CONVROW_W + 2*RADIUS];
    const int tx = threadIdx.x;
    const int block = blockIdx.x / (NUM_SCALES + 3);
    const int scale = blockIdx.x - (NUM_SCALES + 3) * block;
    const int xout = block * CONVROW_W + tx;
    const int loadPos = xout - RADIUS;
    const int yptr = blockIdx.y * pitch;
    const int writePos = yptr + height * pitch * scale + xout;
    float *kernel = d_Kernel + scale * 16;

    // Load data with boundary checks using min/max to avoid if-else branching
    data[tx] = d_Data[yptr + max(0, min(width - 1, loadPos))];
    __syncthreads();

    // Ensure threads within bounds to avoid unnecessary computation
    if (xout < width && tx < CONVROW_W) {
        d_Result[writePos] =
            (data[tx] + data[tx + 8]) * kernel[0] +
            (data[tx + 1] + data[tx + 7]) * kernel[1] +
            (data[tx + 2] + data[tx + 6]) * kernel[2] +
            (data[tx + 3] + data[tx + 5]) * kernel[3] +
            data[tx + 4] * kernel[4];
    }
}