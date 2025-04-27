#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_mull2(float* a, float* b, float* c, int n, int m, int p)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Update block size usage
    int j = blockIdx.y;

    if (i < n) { // Boundary check for i
        float sum = 0.0f; 
        for (int k = 0; k < p; ++k) {
            sum += b[i + n * k] * c[k + p * j];
        }
        a[i + n * j] = sum;
    }
}