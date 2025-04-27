#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(float *a, int offset)
{
    int i = offset + threadIdx.x + blockIdx.x * blockDim.x;
    float x = static_cast<float>(i);

    // Use sincosf to compute sin and cos simultaneously for better performance
    float s, c;
    sincosf(x, &s, &c);
    
    // Use fmaf for fused multiply-add operation to improve accuracy and performance
    a[i] = fmaf(s, s, c * c);
}