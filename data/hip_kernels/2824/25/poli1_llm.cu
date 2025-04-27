#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli1(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        float x = poli[idx];
        // Directly store the result without creating an intermediate variable
        poli[idx] = 3.0f * x * x - 7.0f * x + 5.0f;
    }
}