#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate global thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate the size of a slice (optimized thread index calculation)
    int sz = height * pitch;
    int p = threadIdx.z * sz + y * pitch + x;

    // Ensure the computation is only performed within bounds
    if (x < width && y < height) {
        // Subtract the corresponding elements and store the result
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
}