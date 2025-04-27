#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void initializeElementsTo(int initialValue, int *a, int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x; // Calculate grid stride
    
    for (; i < N; i += gridSize) // Use grid-stride loop for better utilization
    {
        a[i] = initialValue;
    }
}