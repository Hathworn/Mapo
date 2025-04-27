```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    // Calculate global index and total number of threads
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loop for better memory coalescence and reduced iteration count
    for (; idx < len; idx += stride) {
        int r = idx % n;
        int c = idx / n;

        // Copy only if row index is greater than column index
        if (r > c) {
            input[idx] = input[r * n + c];
        }
    }
}