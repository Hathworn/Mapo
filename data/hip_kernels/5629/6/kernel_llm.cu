#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *a, int offset)
{
    int i = offset + threadIdx.x + blockIdx.x * blockDim.x;
    float x = static_cast<float>(i);

    // Precompute sinf(x) and cosf(x) for efficiency
    float s = sincosf(x, &c);
    
    // Utilize fmaf for more precise and efficient computation
    a[i] = fmaf(s, s, c * c);
}