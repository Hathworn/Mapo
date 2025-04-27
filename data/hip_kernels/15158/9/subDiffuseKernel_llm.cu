#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subDiffuseKernel(float *data, int x, int y, float pressure)
{
    // Calculate index only once for efficiency
    int index = NX * x + y;

    // Perform subtraction operation
    data[index] -= pressure;
}