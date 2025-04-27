#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Divide(float *x, size_t idx, size_t N, float W0, float W1)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int step = blockDim.x * gridDim.x;

    // Loop with striding for better GPU utilization
    for (; i < N; i += step)
    {
        float denominator = x[(idx-2)*N+i];
        if (abs(denominator) > 1e-8) // Use scientific notation for better readability
        {
            x[(idx-2)*N+i] = (W0 * x[(idx-1)*N+i]) / (W1 * denominator);
        }
        else
        {
            x[(idx-2)*N+i] = 1.0f; // Use '1.0f' for float consistency
        }
    }
}