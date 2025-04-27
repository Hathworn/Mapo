#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_init(int *mapad, int max, int size)
{
    // Calculate position using block and thread indices
    int position = blockDim.x * blockDim.y * blockIdx.y * gridDim.x 
                 + blockDim.x * blockDim.y * blockIdx.x 
                 + blockDim.x * threadIdx.y 
                 + threadIdx.x;

    // Ensure position is within bounds
    if (position < size) {
        mapad[position] = max;
    }
}