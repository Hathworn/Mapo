#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    // Calculate the global index once outside the if statement to avoid recomputation
    const int x = blockIdx.x * SUBTRACT_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACT_H + threadIdx.y;

    // Check bounds before accessing memory
    if (x < width && y < height) {
        int p = y * pitch + x;
        // Perform the subtraction and store the result
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // Remove unnecessary __syncthreads()
}