#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_THREADS_X 16
#define MAX_THREADS_Y 16

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Optimize by pre-computing thread offset
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    const int z = threadIdx.z;

    int sz = height * pitch;
    int p = z * sz + y * pitch + x;

    // Combine if-check with computation to reduce divergence
    if (x < width && y < height)
    {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
}