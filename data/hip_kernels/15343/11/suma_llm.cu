#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(float *A, float *B, float *C)
{
    // Use blockIdx and blockDim to handle larger arrays efficiently
    int columna = threadIdx.x + blockIdx.x * blockDim.x;
    int fila = threadIdx.y + blockIdx.y * blockDim.y;
    int Id = columna + fila * (gridDim.x * blockDim.x);

    // Ensure index is within the bounds of the array
    if (columna < gridDim.x * blockDim.x && fila < gridDim.y * blockDim.y)
    {
        C[Id] = A[Id] + B[Id];
    }
}