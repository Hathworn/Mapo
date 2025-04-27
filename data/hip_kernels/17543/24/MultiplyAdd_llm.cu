#include "hip/hip_runtime.h"
#include "includes.h"

// Use dim3 for block size initialization for better readability and flexibility
__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate the global index in a more straightforward way
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;
    
    // Check boundary conditions before accessing data
    if (x < width && y < height) {
        // Optimize by removing __syncthreads(), not needed here
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}