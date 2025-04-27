```c
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
    float *kernel = d_Kernel + scale*16;

    // Use ternary operator for conditional loading
    data[tx] = (loadPos < 0) ? d_Data[yptr] : ((loadPos >= width) ? d_Data[yptr + width-1] : d_Data[yptr + loadPos]);

    __syncthreads();

    // Use loop unrolling for computation optimization
    if (xout < width && tx < CONVROW_W) {
        float sum = 0.0f;
        #pragma unroll
        for (int i = 0; i < 4; i++) {
            sum += (data[tx + i] + data[tx + (8 - i)]) * kernel[i];
        }
        sum += data[tx + 4] * kernel[4];
        d_Result[writePos] = sum;
    }
}