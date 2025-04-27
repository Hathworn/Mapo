#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRotate180(float* filters, float* targets, const int filterSize) {
    const int filtIdx = blockIdx.x;
    const int readStart = filterSize * filterSize * filtIdx;
    filters += readStart;
    targets += readStart;

    // Optimize: Use single indexing instead of nested loops.
    for(int idx = threadIdx.y * filterSize + threadIdx.x; idx < filterSize * filterSize; idx += 256) {
        const int x = idx % filterSize;
        const int y = idx / filterSize;
        const int writeX = filterSize - 1 - x;
        const int writeY = filterSize - 1 - y;

        targets[writeY * filterSize + writeX] = filters[y * filterSize + x];
    }
}