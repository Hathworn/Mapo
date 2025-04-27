#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poly_div6(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Simplify polynomials using Horner's method
    if (idx < N) {
        float x = poli[idx];
        float y = __fdividef(1.0f, x);  // Use fast division
        float poly_value = 5.0f + x * (7.0f - x * (9.0f + x * (5.0f + x * (5.0f + x))));
        poli[idx] = poly_value + y;
    }
}