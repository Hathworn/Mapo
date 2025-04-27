#include "hip/hip_runtime.h"
#include "includes.h"

const float PI = 4*atan(1);

__global__ void jacobiMethod(float* grid, float* potential, int sizeX, int sizeY, float scale, int noIters, float tolerance) {

    extern __shared__ float sharedMem[];

    int threadIdX = threadIdx.x;
    int threadIdY = threadIdx.y;

    int bOx = blockIdx.x * blockDim.x;
    int bOy = blockIdx.y * blockDim.y;

    int effBlockSizeX = blockDim.x + 2 * noIters;
    int effBlockSizeY = blockDim.y + 2 * noIters;

    int totalSize = sizeX * sizeY;
    int sharedMemSize = effBlockSizeX * effBlockSizeY;

    // Optimize data copying with boundary checks
    for(int i = threadIdX; i < effBlockSizeX; i += blockDim.x) {
        for (int j = threadIdY; j < effBlockSizeY; j += blockDim.y) {
            int currElemSM = i * effBlockSizeX + j;
            int currElemMain = (i - noIters + bOy) * sizeX + (j - noIters + bOx);
            if (currElemMain >= 0 && currElemMain < totalSize) {
                sharedMem[currElemSM] = grid[currElemMain];
                sharedMem[currElemSM + sharedMemSize] = potential[currElemMain];
            } else {
                sharedMem[currElemSM] = 0;
                sharedMem[currElemSM + sharedMemSize] = 0;
            }
            sharedMem[currElemSM + 2 * sharedMemSize] = 0;
        }
    }
    __syncthreads();

    for(int k = 0; k < noIters; k++) {
        for(int i = threadIdX; i < effBlockSizeX; i += blockDim.x) {
            for(int j = threadIdY; j < effBlockSizeY; j += blockDim.y) {
                int currPos = i * effBlockSizeX + j + 2 * sharedMemSize;
                sharedMem[currPos] = 0;
                // Aggregate neighbors using boundary checks
                if(i > 0) sharedMem[currPos] += (sharedMem[currPos - effBlockSizeY - sharedMemSize] / 4);
                if(i < effBlockSizeX - 1) sharedMem[currPos] += (sharedMem[currPos + effBlockSizeY - sharedMemSize] / 4);
                if(j > 0) sharedMem[currPos] += (sharedMem[currPos - 1 - sharedMemSize] / 4);
                if(j < effBlockSizeY - 1) sharedMem[currPos] += (sharedMem[currPos + 1 - sharedMemSize] / 4);

                if(i < effBlockSizeX - 1 && j < effBlockSizeY - 1) {
                    sharedMem[currPos] += (scale * scale / 4 * sharedMem[currPos - 2 * sharedMemSize]);
                }
            }
        }
        __syncthreads();

        for (int i = threadIdX; i < effBlockSizeX; i += blockDim.x) {
            for (int j = threadIdY; j < effBlockSizeY; j += blockDim.y) {
                int currPos = i * effBlockSizeX + j + 2 * sharedMemSize;
                sharedMem[currPos - sharedMemSize] = sharedMem[currPos];
            }
        }
        __syncthreads();
    }

    // Optimize copying back with boundary checks
    for (int i = threadIdX; i < effBlockSizeX; i += blockDim.x) {
        for (int j = threadIdY; j < effBlockSizeY; j += blockDim.y) {
            if (i >= noIters && j >= noIters && i < effBlockSizeX - noIters && j < effBlockSizeY - noIters) {
                int currElemSM = i * effBlockSizeX + j;
                int currElemMain = (i - noIters + bOy) * sizeX + (j - noIters + bOx);
                if (currElemMain > 0 && currElemMain < totalSize) {
                    potential[currElemMain] = sharedMem[currElemSM + 2 * sharedMemSize];
                }
            }
        }
    }
}