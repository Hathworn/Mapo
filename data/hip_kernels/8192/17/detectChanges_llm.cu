```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void detectChanges(float* a, float* b, float* result, int size, float value)
{
    // Calculate global thread ID more efficiently
    int threadId = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if(threadId < size)
    {
        float a_val = a[threadId];
        float b_val = b[threadId];

        // Use ternary operators for compact conditional assignments
        result[threadId] = (a_val > b_val) ? value : (a_val < b_val) ? -value : 0;
    }
}