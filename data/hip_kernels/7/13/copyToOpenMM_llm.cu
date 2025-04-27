#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyToOpenMM(float *target, float *source, int N) {
    int elementNum = blockIdx.x * blockDim.x + threadIdx.x;
    if (elementNum >= N) return; // Optimize boundary check

    int atom = elementNum / 3;
    target[4 * atom + elementNum % 3] = source[elementNum]; // Rearrange calculation for clarity
}