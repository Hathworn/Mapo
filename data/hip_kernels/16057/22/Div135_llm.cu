```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Div135(int *matrix , int *newMatrix,int nx,int ny,int Max){
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    int Index = iy * nx + ix;
    if (Index >= (nx - 1) * ny) return; // Prevent out-of-bound Index
    
    int i = Index / nx; // Calculate current row
    if (Index < (i + 1) * nx - 1) { // Check index range
        int posisi = matrix[Index + (nx + 1)] * nx + matrix[Index];
        atomicAdd(&newMatrix[posisi], 1);
        printf("Index : %d %d\n", Index + (nx + 1), Index);
    }
}