#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void combine_im_kernel(const float *A, const float *B, float *C, int numElements)
{
    // Calculate index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Constant computation outside of if-condition
    constexpr float B1 = 16.0f;
    constexpr float B2 = 16.0f;
    constexpr float denominator = B1 * B2 - 1;

    // Process only when index i is within bounds
    if (i < numElements)
    {
        // Optimize by removing redundant multiplication
        float temp = A[i] + B[i] * (B2 - 1);
        C[i] = B1 * temp / denominator;
    }
}