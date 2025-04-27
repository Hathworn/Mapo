#include "hip/hip_runtime.h"
#include "includes.h"
#define NOMINMAX

const unsigned int BLOCK_SIZE = 512;

__global__ void fillAndAddKernelV2(float* c, float *a, float* b)
{
    // Calculate the global index for the thread
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    // Precompute sin and cos to reduce redundant calculations
    double sinValue = sin((double)i);
    double cosValue = cos((double)i);
    // Use the precomputed values for a and b
    a[i] = sinValue * sinValue;
    b[i] = cosValue * cosValue;
    // Compute the result directly
    c[i] = a[i] + b[i];
}