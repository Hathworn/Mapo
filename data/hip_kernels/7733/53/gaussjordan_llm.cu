#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaussjordan(float *A, float *I, int n, int i)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < n && y < n) {
        if (x != i) {
            float Axi = A[x*n + i];
            float Ixi_y = I[i*n + y] * Axi; // Pre-compute I[i*n+y] * A[x*n+i]
            I[x*n + y] -= Ixi_y;           // Deduct in-place to avoid recalculation
            if (y != i) {
                A[x*n + y] -= A[i*n + y] * Axi; // Deduct in-place to avoid recalculation
            }
        }
    }
}