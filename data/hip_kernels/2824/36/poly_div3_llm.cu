#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void poly_div3(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only if idx is within bounds
    if (idx < N) {
        float x = poli[idx];

        // Use temporary variable to store complex polynomial expression
        float polynomial = x * (9 + x * (5 + x * (5 + x)));
        poli[idx] = 5 + x * (7 - polynomial) + 5.0 / x;
    }
}