#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli4(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < N) {
        float x = poli[idx];
        float sqrt_x = sqrt(x);
        float x_squared = x * x;
        // Reduce redundant calculations
        poli[idx] = 5 + 5 * x + 5 * x * sqrt_x + 5 * sqrt_x * x_squared + 
                    5 * x * sqrt_x * x_squared + 5 * x * sqrt_x * sqrt_x * x_squared;
    }
}