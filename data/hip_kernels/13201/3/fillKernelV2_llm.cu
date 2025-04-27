#include "hip/hip_runtime.h"
#include "includes.h"
#define NOMINMAX

const unsigned int BLOCK_SIZE = 512;

__global__ void fillKernelV2(float *a, float* b)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    double angle = static_cast<double>(i); // Precompute angle
    double sin_val = sin(angle);           // Precompute sin value
    double cos_val = cos(angle);           // Precompute cos value
    a[i] = sin_val * sin_val;              // Use precomputed sin value
    b[i] = cos_val * cos_val;              // Use precomputed cos value
}