#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stream(float *dA, float *dB, float *dC, float alpha, int N) {
    // Optimize by unrolling the loop to increase ILP (Instruction-Level Parallelism)
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (int i = id; i < N; i += stride) {
        dA[i] = dB[i] + alpha * dC[i];
    }
}