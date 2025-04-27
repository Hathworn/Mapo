#include "hip/hip_runtime.h"
#include "includes.h"

__device__ bool checkBoundary(int x, int y, int blockDim_x, int gridDim_y) {
    return (x == 0 || x == (blockDim_x-1) || y == 0 || y == (gridDim_y-1));
}

__global__ void mSetFieldBoundary(float *field, float scalar) {
    int x = threadIdx.x;
    int y = blockIdx.x;
    if (checkBoundary(x, y, blockDim.x, gridDim.x)) {
        int Idx = y * blockDim.x + x;
        
        // Simplify boundary condition checks and field updates
        if (x == 0) {
            if (y == 0) {
                field[Idx] = field[Idx + blockDim.x + 1] * scalar;
            } else if (y == gridDim.x - 1) {
                field[Idx] = field[Idx - blockDim.x + 1] * scalar;
            } else {
                field[Idx] = field[Idx + 1] * scalar;
            }
        } else if (x == blockDim.x - 1) {
            if (y == 0) {
                field[Idx] = field[Idx + blockDim.x - 1] * scalar;
            } else if (y == gridDim.x - 1) {
                field[Idx] = field[Idx - blockDim.x - 1] * scalar;
            } else {
                field[Idx] = field[Idx - 1] * scalar;
            }
        } else {
            if (y == 0) {
                field[Idx] = field[Idx + blockDim.x] * scalar;
            } else {
                field[Idx] = field[Idx - blockDim.x] * scalar;
            }
        }
    }
}