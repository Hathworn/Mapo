#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyFromOpenMM(float *target, float *source, int N) {
    const int elementNum = blockIdx.x * blockDim.x + threadIdx.x;
    // Boundary check adjusted to be less-than to handle exact boundary cases
    if (elementNum < N) {
        const int atom = elementNum / 3;
        // Streamline the access to avoid repeated calculations
        target[elementNum] = source[atom * 4 + elementNum % 3];
    }
}