#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float* polynomial, const size_t N) {
    int thread = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition
    if (thread >= N) return;

    float x = polynomial[thread];
    // Precompute common values to reduce redundant calculations
    float x2 = x * x; 
    polynomial[thread] = 3 * x2 - 7 * x + 5;
}