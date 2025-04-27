#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeMoment(int *readArr, int *writeArr, double *weightArr, int n) {
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Efficient boundary check and thread culling
    if (row < 517 && col < 517) {
        float influence = 0.0f;

        // Unrolling loops for higher performance
        #pragma unroll
        for (int i = -2; i < 3; i++) {
            #pragma unroll
            for (int j = -2; j < 3; j++) {
                int y = (row + i + n) % n;
                int x = (col + j + n) % n;
                influence += weightArr[(i + 2) * 5 + (j + 2)] * readArr[y * n + x];
            }
        }

        int index = row * n + col;
        writeArr[index] = readArr[index];
        if (influence < -diff) 
            writeArr[index] = -1;
        else if (influence > diff) 
            writeArr[index] = 1;
    }
    // Synchronization removed as it is unnecessary here
}