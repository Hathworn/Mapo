#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified grid indexing
    if (i < n) {
        float diff = truth[i] - pred[i];
        error[i] = fabsf(diff); // Use faster built-in function for absolute value
        delta[i] = copysignf(1.0f, diff); // Utilize copysignf for concise conditional assignment
    }
}