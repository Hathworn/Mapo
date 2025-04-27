#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void threshold(float *vec, int *bin, const int k_bin, const int n)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Check xIndex within bounds and that bin value exceeds k_bin
    if (xIndex < n && bin[xIndex] > k_bin)
    {
        // Set vector value to zero
        vec[xIndex] = 0.0f;
    }
}