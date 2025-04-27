#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate global indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    const int z = blockIdx.z * blockDim.z + threadIdx.z; // Use 3D grid for better utilization

    int sz = height * pitch;
    int p = z * sz + y * pitch + x;
    
    // Ensure in-bound checks
    if (x < width && y < height)
    {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // Remove __syncthreads since no shared memory is used
}