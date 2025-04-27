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
    
    // Load data with boundary check using max and min 
    data[tx] = d_Data[yptr + max(0, min(loadPos, width - 1))];
    __syncthreads();

    // Perform the convolution only for valid xout
    if (xout < width && tx < CONVROW_W)
    {
        float result = 0.0f;
        // Unroll the loop for better performance
        #pragma unroll
        for (int i = 0; i < 4; ++i)
            result += (data[tx + i] + data[tx + 8 - i]) * kernel[i];
        result += data[tx + 4] * kernel[4];
        
        d_Result[writePos] = result;
    }
    __syncthreads();
}
```
