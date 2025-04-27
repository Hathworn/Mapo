#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kern_ConvertBuffer(short* agreement, float* output, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Use HIP specific index calculation

    if (idx < size)
    {
        output[idx] = static_cast<float>(agreement[idx]); // Use static_cast for type conversion
    }
}