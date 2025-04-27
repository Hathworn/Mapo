#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Div90(int *matrix, int *newMatrix, int nx, int ny, int Max) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate the flattened index
    int Index = iy * nx + ix;

    // Ensure within bounds before proceeding
    if (ix < nx - 1 && iy < ny - 1 && (Index == 0 || Index % 2 == 0)) {
        // Calculate positions
        int posisi1 = matrix[Index + nx] * nx + matrix[Index];
        int posisi2 = matrix[Index + (nx + 1)] * nx + matrix[Index + 1];

        // Perform atomic adds
        atomicAdd(&newMatrix[posisi1], 1);
        atomicAdd(&newMatrix[posisi2], 1);

        // Debugging print statement (can be removed in production)
        printf("Index : %d %d dan %d %d\n", Index + nx, Index, Index + (nx + 1), Index + 1);
    }
}