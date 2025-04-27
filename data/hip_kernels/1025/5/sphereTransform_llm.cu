#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sphereTransform(float *data, const unsigned int N)
{
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads are within bounds and coalesce data access
    if (idx < N)
    {
        float temp = data[idx];
        data[idx] = temp * 360.0f - 180.0f;      // Transformation for first half of data
        data[idx + N] = acosf(2.0f * data[idx + N] - 1.0f); // Transformation for second half
    }
}