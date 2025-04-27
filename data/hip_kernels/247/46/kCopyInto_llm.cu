#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kCopyInto(float* images, float* targets, const int imgSize, const int paddingSize, const int numImages) {
    // Calculate unique image index
    const int imgIdx = blockIdx.y * gridDim.x + blockIdx.x;
    if (imgIdx < numImages) {
        const int targetSize = imgSize + 2 * paddingSize;
        images += imgIdx * imgSize * imgSize;
        targets += imgIdx * targetSize * targetSize + paddingSize * targetSize + paddingSize;

        // Optimize thread loop increment and synchronicity by using blockDim
        for (int y = threadIdx.y; y < imgSize; y += blockDim.y) {
            for (int x = threadIdx.x; x < imgSize; x += blockDim.x) {
                targets[y * targetSize + x] = images[y * imgSize + x];
            }
        }
    }
}