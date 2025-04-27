#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void cudaKernel(int n, double* gpuWeights, int* gpuG, int* gpuTempGrid, int *flag)
{
    // Moment's coordinates in the grid
    int momentCol = blockIdx.x * blockDim.x + threadIdx.x;
    int momentRow = blockIdx.y * blockDim.y + threadIdx.y;

    double weightFactor = 0.0;

    // Each thread calculates the spin for a block of moments
    for (int i = momentRow; i < n; i += blockDim.y * gridDim.y)
    {
        for (int j = momentCol; j < n; j += blockDim.x * gridDim.x)
        {
            weightFactor = 0.0;
            // Calculate total neighbourhood influence
            for (int weightsRow = 0; weightsRow < 5; weightsRow++)
            {
                for (int weightsCol = 0; weightsCol < 5; weightsCol++)
                {
                    if (weightsCol == 2 && weightsRow == 2)
                        continue;

                    // Calculate neighbour's coordinates using modulus for boundary conditions
                    int gridRowIdx = (weightsRow - 2 + i + n) % n;
                    int gridColIdx = (weightsCol - 2 + j + n) % n;

                    // Reduce to minimize reads by using shared memory (if applicable)
                    weightFactor += gpuG[gridRowIdx * n + gridColIdx] * gpuWeights[weightsRow * 5 + weightsCol];
                }
            }

            // Update moment's atomic spin
            if (weightFactor < 0.0001 && weightFactor > -0.0001)
            {
                gpuTempGrid[n * i + j] = gpuG[n * i + j];
            }
            else if (weightFactor > 0.00001)
            {
                gpuTempGrid[n * i + j] = 1;
                if (gpuG[n * i + j] == -1)
                {
                    atomicOr(flag, 1); // Atomic operation to avoid race condition
                }
            }
            else
            {
                gpuTempGrid[n * i + j] = -1;
                if (gpuG[n * i + j] == -1)
                {
                    atomicOr(flag, 1); // Atomic operation to avoid race condition
                }
            }
        }
    }
}