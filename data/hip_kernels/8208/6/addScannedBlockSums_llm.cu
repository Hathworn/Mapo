#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addScannedBlockSums(float *input, float *aux, int len) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int dx = blockDim.x;
    int i = 2 * bx * dx + tx;

    // Pre-calculate previous block sum to avoid repeated computation
    float prevBlockSum = (bx > 0) ? input[bx - 1] : 0;

    if (i < len) {
        aux[i] += prevBlockSum; // Add block sum to element i
    }

    if (i + dx < len) {
        aux[i + dx] += prevBlockSum; // Add block sum to element i + dx
    }
}