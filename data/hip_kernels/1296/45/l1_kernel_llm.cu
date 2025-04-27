#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified block index calculation
    const int stride = blockDim.x * gridDim.x;      // Calculate stride for loop unrolling

    while (i < n) {                                 // Loop over the indices using stride
        float diff = truth[i] - pred[i];
        error[i] = fabsf(diff);                     // Use fast math function for absolute value
        delta[i] = copysignf(1.0f, diff);           // Use fast math function for sign
        i += stride;                                // Move to next index
    }
}