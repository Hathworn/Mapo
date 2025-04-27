#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LowPassRowMulti(float *d_Result, float *d_Data, int width, int pitch, int height) {
    __shared__ float data[CONVROW_W + 2 * RADIUS];
    const int tx = threadIdx.x;
    const int block = blockIdx.x / (NUM_SCALES + 3);
    const int scale = blockIdx.x % (NUM_SCALES + 3);
    const int xout = block * CONVROW_W + tx;
    const int loadPos = xout - RADIUS;
    const int yptr = blockIdx.y * pitch;
    const int writePos = yptr + height * pitch * scale + xout;
    float *kernel = d_Kernel + scale * 16;

    // Better boundary checking with min/max
    if (loadPos < 0) {
        data[tx] = d_Data[yptr];
    } else if (loadPos >= width) {
        data[tx] = d_Data[yptr + width - 1];
    } else {
        data[tx] = d_Data[yptr + loadPos];
    }
    __syncthreads();

    // Avoid redundant computations and use loop for unrolling operation
    if (xout < width && tx < CONVROW_W) {
        float sum = 0.0f;
        for (int i = 0; i < 5; ++i) {
            sum += (data[tx + i] + data[tx + 8 - i]) * kernel[i];
        }
        d_Result[writePos] = sum;
    }
    __syncthreads();
}