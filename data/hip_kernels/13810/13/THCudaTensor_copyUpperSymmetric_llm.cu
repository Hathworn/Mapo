#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize loop by avoiding unnecessary increments beyond grid size
    while (idx < len) {
        const int r = idx % n;
        const int c = idx / n;
        if (r > c) {
            input[idx] = input[r * n + c];
        }
        idx += blockDim.x * gridDim.x; // Move to next relevant index within grid
    }
}