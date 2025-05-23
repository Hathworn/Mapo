#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaKernel(int n, double* gpuWeights, int* gpuG, int* gpuTempGrid, int* flag) {
    // Moment's coordinates in the grid //
    int momentRow = blockIdx.y * blockDim.y + threadIdx.y;
    int momentCol = blockIdx.x * blockDim.x + threadIdx.x;
    int gridRowIdx, gridColIdx;

    // Variable storing the total neighbourhood influence //
    double weightFactor = 0.0;

    // Check if coordinates are valid //
    if (momentRow < n && momentCol < n) {
        // Read 24 neighbours of every moment and calculate their total influence //
        for (int row = 0; row < 5; ++row) {
            for (int col = 0; col < 5; ++col) {
                if (row == 2 && col == 2)
                    continue;
                // Calculate neighbour's coordinates in G //
                // using modulus to satisfy boundary conditions //
                gridRowIdx = (row - 2 + momentRow + n) % n;
                gridColIdx = (col - 2 + momentCol + n) % n;

                weightFactor += gpuG[gridRowIdx * n + gridColIdx] * gpuWeights[row * 5 + col];
            }
        }

        // Update moment's atomic spin using atomicCAS for atomic operations //
        // Set flag if a spin value transition has been done //
        int currentSpin = gpuG[n * momentRow + momentCol];
        int newSpin;
        if (weightFactor < 0.0001 && weightFactor > -0.0001) {
            newSpin = currentSpin;
        } else if (weightFactor > 0.00001) {
            newSpin = 1;
            if (currentSpin == -1) {
                atomicExch(flag, 1);
            }
        } else {
            newSpin = -1;
            if (currentSpin == 1) {
                atomicExch(flag, 1);
            }
        }
        gpuTempGrid[n * momentRow + momentCol] = newSpin;
    }
}