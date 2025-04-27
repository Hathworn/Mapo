#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    // Calculate global thread position
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Utilize shared memory (if necessary, based on additional requirements or data reuse)
    // Declare shared memory if needed: __shared__ float sharedData[];

    // Check bounds and perform subtraction
    if (x < width && y < height) {
        int p = y * pitch + x;
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    
    // Remove unnecessary synchronization if no shared memory use
    // __syncthreads(); // Removed as no shared memory operations require synchronization
}