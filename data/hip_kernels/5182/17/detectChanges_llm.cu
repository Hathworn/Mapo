#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void detectChanges(float* a, float* b, float* result, int size, float value)
{
// Calculate global thread ID
int threadId = blockIdx.x * blockDim.x + threadIdx.x;

// Ensure thread processes only within bounds
if(threadId < size)
{
    float aValue = a[threadId]; // Load a[threadId] into register
    float bValue = b[threadId]; // Load b[threadId] into register

    // Compare values and store result
    result[threadId] = (aValue > bValue) ? value : (aValue < bValue ? -value : 0.0f);
}
}