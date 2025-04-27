#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate indices for x and y positions
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int sz = height * pitch;

    // Consolidate computation of linear index
    int p = y * pitch + x;
    
    // Check bounds before computation
    if (x < width && y < height)
    {
        // Simplifying and ensuring work per thread is independent
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
}