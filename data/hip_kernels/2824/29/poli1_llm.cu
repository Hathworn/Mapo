#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli1(float* __restrict__ poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds before accessing the array
    if (idx < N) {
        float x = poli[idx];
        // Calculate the polynomial value and assign
        poli[idx] = fmaf(fmaf(3.0f, x, -7.0f), x, 5.0f);
    }
}