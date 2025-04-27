#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LowPassRowMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    extern __shared__ float data[]; // Dynamic shared memory for flexibility
    const int tx = threadIdx.x;
    const int block = blockIdx.x / (NUM_SCALES + 3);
    const int scale = blockIdx.x - (NUM_SCALES + 3) * block;
    const int xout = block * CONVROW_W + tx;
    const int loadPos = xout - RADIUS;
    const int yptr = blockIdx.y * pitch;
    const int writePos = yptr + height * pitch * scale + xout;
    float *kernel = d_Kernel + scale * 16;

    // Load data into shared memory ensuring data locality
    if (loadPos < 0)
        data[tx] = d_Data[yptr];
    else if (loadPos >= width)
        data[tx] = d_Data[yptr + width - 1];
    else
        data[tx] = d_Data[yptr + loadPos];
    __syncthreads();

    // Perform convolution only if within bounds
    if (xout < width && tx < CONVROW_W) {
        float sum = 0.0f;
        #pragma unroll // Unroll loop for optimization
        for (int i = 0; i < 5; ++i) {
            sum += (data[tx + i] + data[tx + 8 - i]) * kernel[i];
        }
        sum -= data[tx + 8]*kernel[4]; // Adjust sum for the defined kernel calculation
        d_Result[writePos] = sum;
    }
}