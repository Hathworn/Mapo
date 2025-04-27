#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCopyInto(float* images, float* targets, const int imgSize, const int paddingSize, const int numImages) {
    const int imgIdx = blockIdx.y * gridDim.x + blockIdx.x;
    if (imgIdx < numImages) {
        const int targetSize = imgSize + 2 * paddingSize;
        images += imgIdx * imgSize * imgSize;
        targets += imgIdx * targetSize * targetSize + paddingSize * targetSize + paddingSize;

        // Loop unrolling for better performance
        for (int y = threadIdx.y; y < imgSize; y += 16) {
            int imgOffset = y * imgSize;
            int targetOffset = y * targetSize;
            for (int x = threadIdx.x; x < imgSize; x += 16) {
                targets[targetOffset + x] = images[imgOffset + x];
            }
        }
    }
}