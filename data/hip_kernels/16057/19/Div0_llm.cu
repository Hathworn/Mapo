#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Div0(int *matrix, int *newMatrix, int nx, int ny, int Max) {
    // Calculate global thread index.
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int Index = iy * nx + ix;
    
    // Check boundary conditions for valid index.
    if (ix < nx - 1 && iy < ny - 1) { 
        for (int i = 0; i < nx; i += 2) {
            if (Index >= i * nx && Index < ((i + 1) * nx) - 1) {
                // Precompute matrix values once to reduce redundant calculations.
                int matrix_val = matrix[Index];
                int matrix_val_plus1 = matrix[Index + 1];
                int matrix_val_plusMax = matrix[Index + Max];
                int matrix_val_plusMax1 = matrix[Index + (Max + 1)];

                // Calculate position and perform atomic adds.
                int posisi1 = matrix_val * Max + matrix_val_plus1;
                atomicAdd(&newMatrix[posisi1], 1);

                int posisi2 = matrix_val_plusMax * Max + matrix_val_plusMax1;
                atomicAdd(&newMatrix[posisi2], 1);
            }
        }
    }
}