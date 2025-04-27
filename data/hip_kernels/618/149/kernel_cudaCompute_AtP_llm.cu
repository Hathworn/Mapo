#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaCompute_AtP(double *d_A, double *d_P, double *d_AtP, int rows, int columns)
{
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    int total_elements = rows * columns;
    
    // Ensure each thread processes multiple elements for better utilization
    for (int i = ind; i < total_elements; i += gridDim.x * blockDim.x)
    {
        int row = i % rows;
        int column = i / rows;
        
        // Pre-compute memory access indices for coalesced memory access
        int a_index = column + row * columns;
        int atp_index = row + column * rows;
        
        d_AtP[atp_index] = d_A[a_index] * d_P[column];
    }
}