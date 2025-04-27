#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void erosion2(uint8_t *inData, uint8_t *outData, int radiusX, int radiusY, int width, int height)
{
    __shared__ uint8_t localData[TILE_SIZE * TILE_SIZE];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int gx = blockIdx.x * blockDim.x + tx;
    int gy = blockIdx.y * blockDim.y + ty;

    // Cache input to shared memory with boundary checks
    int sharedIndex = TILE_SIZE * (radiusY + ty) + radiusX + tx;
    
    int x = min(max(gx, 0), width - 1);
    int y = min(max(gy, 0), height - 1);

    localData[sharedIndex] = inData[width * y + x];
    __syncthreads();

    // Initialize search boundaries
    int x1 = max(tx - radiusX, 0);
    int x2 = min(tx + radiusX, blockDim.x - 1);
    int y1 = max(ty - radiusY, 0);
    int y2 = min(ty + radiusY, blockDim.y - 1);

    uint8_t minimum = 255;
    // Traverse the neighborhood
    for (int j = y1; j <= y2; ++j) {
        for (int i = x1; i <= x2; ++i) {
            minimum = min(minimum, localData[TILE_SIZE * (radiusY + j) + radiusX + i]);
        }
    }

    // Write the minimum value to the output
    if (gx < width && gy < height) {
        outData[width * gy + gx] = minimum;
    }
}