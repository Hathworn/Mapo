#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli2(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        float x = poli[idx];
        // Use math library to optimize polynomial computation
        float x2 = x * x;
        poli[idx] = 4 * x2 * x + 3 * x2 - 7 * x + 5;
    }
}