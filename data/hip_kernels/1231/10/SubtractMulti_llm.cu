#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;
    const int z = blockIdx.z * blockDim.z + threadIdx.z;  // Calculate z index
    int sz = height * pitch;
    int p = z * sz + y * pitch + x;
    
    // Ensure indices are within bounds before accessing array
    if (x < width && y < height && z < gridDim.z)
    {
        // Perform subtraction operation
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
}