#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcularCRS(int *val, int *col_ind, int *row_ptr, int *u, int *resultado, int l) {
    // Calculate unique global thread index
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if (globalIndex < l) { // Ensure within bounds
        int suma = 0;
        
        // Use shared memory for commonly accessed data to optimize memory access
        __shared__ int shared_u[blockDim.y];
        
        // Load data into shared memory
        if (threadIdx.y < l) {
            shared_u[threadIdx.y] = u[threadIdx.y + ((col_ind[row_ptr[globalIndex] - 1] - 1) * l)];
        }
        
        __syncthreads(); // Synchronize threads within block

        // Sum using shared data
        for (int k = row_ptr[globalIndex] - 1; k < row_ptr[globalIndex + 1] - 1; k++) {
            suma += val[k] * shared_u[col_ind[k] - 1];
        }

        // Store the result
        resultado[globalIndex * l + threadIdx.y] = suma;
    }
}