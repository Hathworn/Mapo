#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *a, int offset)
{
    int i = offset + threadIdx.x + blockIdx.x * blockDim.x;
    float x = (float)i;

    // Precompute sin and cos to avoid redundant calculations
    float s = sinf(x);
    float c = cosf(x);

    // Use hypotf for computing sqrt(s*s + c*c) directly (optimizes numerical stability)
    a[i] = a[i] + hypotf(s, c);
}