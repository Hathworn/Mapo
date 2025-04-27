```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LowPassRowMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    __shared__ float data[CONVROW_W + 2*RADIUS]; // Shared memory for current block
    const int tx = threadIdx.x;
    const int block = blockIdx.x / (NUM_SCALES + 3);
    const int scale = blockIdx.x - (NUM_SCALES + 3) * block;
    const int xout = block * CONVROW_W + tx;
    const int loadPos = xout - RADIUS;
    const int yptr = blockIdx.y * pitch;
    const int writePos = yptr + height * pitch * scale + xout;
    float *kernel = d_Kernel + scale * 16;

    // Using clamp to load data safely
    int safeLoadPosLeft = max(loadPos, 0);
    int safeLoadPosRight = min(loadPos, width - 1);
    data[tx] = d_Data[yptr + (loadPos < 0 || loadPos >= width ? safeLoadPosRight : loadPos)];
    __syncthreads();

    // Ensure valid position before writing result
    if (xout < width && tx < CONVROW_W) {
        float sum = 0.0f;
        for (int i = 0; i < 5; ++i) {
            sum += (data[tx + i] + data[tx + 8 - i]) * kernel[i];
        }
        d_Result[writePos] = sum;
    }
    __syncthreads();
}