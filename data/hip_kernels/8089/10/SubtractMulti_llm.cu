#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Compute x and y coordinates
    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;
    
    // Compute index within the 3D data layout
    const int pitch_height = pitch * height;
    const int p = threadIdx.z * pitch_height + y * pitch + x;
    
    // Check within bounds and perform subtraction
    if (x < width && y < height) 
    {
        d_Result[p] = d_Data[p] - d_Data[p + pitch_height];
    }
}