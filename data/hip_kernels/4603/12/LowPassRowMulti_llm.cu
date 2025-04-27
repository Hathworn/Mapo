#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LowPassRowMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    __shared__ float data[CONVROW_W + 2*RADIUS];
    const int tx = threadIdx.x;
    const int block = blockIdx.x/(NUM_SCALES+3);
    const int scale = blockIdx.x - (NUM_SCALES+3)*block;
    const int xout = block*CONVROW_W + tx;
    const int loadPos = xout - RADIUS;
    const int yptr = blockIdx.y*pitch;
    const int writePos = yptr + height*pitch*scale + xout;
    const float *kernel = d_Kernel + scale*16;

    // Pre-fetched boundary condition handling
    float val;
    if (loadPos < 0)
        val = d_Data[yptr];
    else if (loadPos >= width)
        val = d_Data[yptr + width - 1];
    else
        val = d_Data[yptr + loadPos];
    data[tx] = val;
    __syncthreads();

    // Avoid out-of-bound computation with redundant threads
    if (xout < width && tx < CONVROW_W) {
        float sum = 0.0f;
        #pragma unroll
        for (int i = 0; i < 4; ++i) {
            sum += (data[tx + i] + data[tx + 8 - i]) * kernel[i];
        }
        sum += data[tx + 4] * kernel[4];
        d_Result[writePos] = sum;
    }
}