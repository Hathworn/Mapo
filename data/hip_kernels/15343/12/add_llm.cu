#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized with shared memory
__global__ void add(float *A, float *C)
{
    // Calculate column and row indices
    int columna = threadIdx.x;
    int fila = threadIdx.y;

    // Calculate linear index
    int Id = columna + fila * blockDim.x;

    // Define shared memory for data reuse
    extern __shared__ float tile[];

    // Load data into shared memory
    tile[threadIdx.y * blockDim.x + threadIdx.x] = A[Id];
    __syncthreads();

    // Calculate neighbor indices
    int id1 = (columna - 1) + fila * blockDim.x;
    int id2 = (columna + 1) + fila * blockDim.x;
    int id3 = columna + (fila - 1) * blockDim.x;
    int id4 = columna + (fila + 1) * blockDim.x;

    // Use shared memory when conditions are met
    if ((fila > 0 && fila < N - 1) && (columna > 0 && columna < N - 1)) {
        // Accumulate neighboring values using shared memory data
        C[Id] = tile[threadIdx.y * blockDim.x + (threadIdx.x - 1)] +
                tile[threadIdx.y * blockDim.x + (threadIdx.x + 1)] +
                tile[(threadIdx.y - 1) * blockDim.x + threadIdx.x] +
                tile[(threadIdx.y + 1) * blockDim.x + threadIdx.x];
    } else {
        // Boundary condition
        C[Id] = A[Id];
    }
}