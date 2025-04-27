#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCopyInto(float* images, float* targets, const int imgSize, const int paddingSize, const int numImages) {
    const int imgIdx = blockIdx.y * gridDim.x + blockIdx.x;
    if (imgIdx < numImages) {
        const int targetSize = imgSize + 2 * paddingSize;
        images += imgIdx * imgSize * imgSize;
        targets += imgIdx * targetSize * targetSize + paddingSize * targetSize + paddingSize;

        // Use shared memory for better memory access pattern
        __shared__ float tile[16][16];
        
        for (int y = threadIdx.y; y < imgSize; y += 16) {
            for (int x = threadIdx.x; x < imgSize; x += 16) {
                // Load image data into shared memory
                tile[threadIdx.y][threadIdx.x] = images[y * imgSize + x];
                __syncthreads(); // Synchronize to ensure all data is loaded
                
                // Copy from shared memory to target
                targets[y * targetSize + x] = tile[threadIdx.y][threadIdx.x];
            }
        }
    }
}