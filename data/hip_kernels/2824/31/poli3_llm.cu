```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli3(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < N) {
        float x = poli[idx];
        float x2 = x * x; // precompute x^2
        float x4 = x2 * x2; // precompute x^4
        poli[idx] = 5 + 5 * x + 5 * x2 + 5 * x * x2 + 5 * x4 + 5 * x * x4; // optimize polynomial evaluation
    }
}