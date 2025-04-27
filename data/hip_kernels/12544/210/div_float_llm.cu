#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void div_float(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Perform the division with early return if b[i] is zero, to prevent division by zero
        float divisor = b[i];
        if (divisor != 0.0f) 
        {
            sum[i] = a[i] / divisor;
        } 
        else 
        {
            sum[i] = 0.0f; // or NaN/inf based on how you wish to handle division by zero
        }
    }
}