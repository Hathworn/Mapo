#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Calculate unique thread index considering block and thread dimensions
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Boundary check to ensure threads only operate within valid data range
    if (x < width && y < height) {
        // Perform subtraction only if within boundaries
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }

    // __syncthreads() is unnecessary here as no shared memory is involved
}