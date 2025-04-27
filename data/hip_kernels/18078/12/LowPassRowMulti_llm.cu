#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LowPassRowMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    __shared__ float data[CONVROW_W + 2*RADIUS];
    const int tx = threadIdx.x;
    const int block = blockIdx.x / (NUM_SCALES + 3);
    const int scale = blockIdx.x - (NUM_SCALES + 3) * block;
    const int xout = block * CONVROW_W + tx;
    const int loadPos = xout - RADIUS;
    const int yptr = blockIdx.y * pitch;
    const int writePos = yptr + height * pitch * scale + xout;
    float *kernel = d_Kernel + scale * 16;

    // Load data into shared memory with boundary checks
    if (loadPos < 0)
        data[tx] = d_Data[yptr];
    else if (loadPos >= width)
        data[tx] = d_Data[yptr + width - 1];
    else
        data[tx] = d_Data[yptr + loadPos];
    __syncthreads();

    // Compute convolution, only if within bounds
    if (xout < width && tx < CONVROW_W) {
        float result = 0.0f;
        #pragma unroll 5 // Unroll loop for better performance
        for (int i = 0; i < 5; ++i) {
            result += (data[tx + i] + data[tx + (8 - i)]) * kernel[i];
        }
        d_Result[writePos] = result;
    }
    __syncthreads();
}