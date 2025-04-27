#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *a, int offset)
{
    int i = offset + threadIdx.x + blockIdx.x * blockDim.x;
    float x = static_cast<float>(i);

    // Precompute squares to avoid duplicate calculations
    float s = sinf(x);
    float c = cosf(x);
    float s2_c2 = s * s + c * c;
    
    // Use fmaf for better performance (if applicable)
    a[i] += sqrtf(s2_c2);
}