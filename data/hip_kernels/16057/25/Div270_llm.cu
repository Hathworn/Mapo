#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Div270(int *matrix , int *newMatrix,int nx,int ny,int Max){
    // Calculate the unique index for the current thread
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    
    int Index = iy * nx + ix;

    // Ensure we are within bounds
    if (ix < nx - 1 && iy < ny - 1){

        // Check if Index is even or zero for efficient processing
        if (Index == 0 || Index % 2 == 0) {
            // Optimized calculation for 'posisi' and atomic addition to 'newMatrix'
            int posisi1 = matrix[Index] * nx + matrix[Index + nx];
            int posisi2 = matrix[Index + 1] * nx + matrix[Index + (nx + 1)];
            
            atomicAdd(&newMatrix[posisi1], 1);
            atomicAdd(&newMatrix[posisi2], 1);

            // Debug print statement
            printf("Index : %d %d dan %d %d\n", Index, Index + nx , Index + 1, Index + (nx + 1));
        }
    }
}