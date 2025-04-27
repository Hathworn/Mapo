#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addNccValues(const float* prevData, float* result, int patches)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < patches)
    {
        // Move redundant calculations outside the if statement
        float value1 = prevData[3 * tid + 1];
        float value2 = prevData[3 * tid + 2];
        float norm = value1 * value2;
        float res = 0.0f;
        if (norm > 0.0f)
            res = prevData[3 * tid] / sqrtf(norm);
        // Use efficient memory access by using += only once
        result[tid] += res;
    }
}