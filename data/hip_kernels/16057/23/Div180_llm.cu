#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Div180(int *matrix, int *newMatrix, int nx, int ny, int Max) {
    // Compute the global index
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Compute the linear index
    int Index = iy * nx + ix;

    // Check if the index is within the valid range before processing
    if (ix < nx && iy < ny) {
        int posisi = 0;
        
        // Ensure that the loops do not exceed array bounds
        for (int i = 0; i < nx; i += 2) {
            if (Index >= i * nx && Index < ((i + 1) * nx) - 1) {
                
                // First atomic addition
                posisi = matrix[Index + 1] * nx + matrix[Index];
                atomicAdd(&newMatrix[posisi], 1);
                
                // Second atomic addition
                // Add a boundary check to prevent out-of-bounds access
                if(Index + (nx + 1) < nx * ny) {
                    posisi = matrix[Index + (nx + 1)] * nx + matrix[Index + nx];
                    atomicAdd(&newMatrix[posisi], 1);
                }
            }
        }
    }
}