#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divMat(float *a, int N)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single comparison to optimize boundary conditions
    if (idx < N)
    {
        // Utilize pointer arithmetic for direct access
        a[idx * N] /= N;
    }
}