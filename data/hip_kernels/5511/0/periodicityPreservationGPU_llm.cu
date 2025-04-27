#include "hip/hip_runtime.h"
#include "includes.h"

#define BUFSIZE 64
#define BLOCK_SIZE 16

// Periodicity Preservation retains our periodicity
__global__ void periodicityPreservationGPU(int N, char *cells)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use threads for rows adaptation
    if (i >= 1 && i <= N) {
        // Copy first real row to bottom extra row
        cells[(N+2)*(N+1)+i] = cells[(N+2)+i];
        
        // Copy last real row to top extra row
        cells[i] = cells[(N+2)*N + i];
    }

    // Ensure all threads complete row operations before column operations
    __syncthreads();

    // Use threads for columns adaptation
    if (i <= N+1) {
        // Copy first real column to right last extra column
        cells[i*(N+2)+N+1] = cells[i*(N+2)+1];
        
        // Copy last real column to left last extra column
        cells[i*(N+2)] = cells[i*(N+2) + N];
    }
}