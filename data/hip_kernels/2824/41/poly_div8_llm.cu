#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poly_div8(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < N) {
        float x = poli[idx];
        float x_squared = x * x; // Cache x^2
        float temp = 5 + x * (5 + x); // Compute part of the polynomial
        float result = 5 + x * (7 - x * (9 + x * temp)) + 5.0f / x; // Simplify calculation
        poli[idx] = result;
    }
}