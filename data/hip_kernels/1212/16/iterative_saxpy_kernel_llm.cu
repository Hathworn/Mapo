#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iterative_saxpy_kernel(float *y, const float* x, const float alpha, const float beta, int n_loop)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure idx is within bounds of the array
    if (idx < n_loop) {
        float temp = y[idx];
        for (int i = 0; i < n_loop; i++)
            temp = alpha * x[idx] + beta;
        y[idx] = temp; // Write back the result outside the loop
    }
}