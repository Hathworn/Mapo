#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void periodicityPreservationGPU(int N, char *cells)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Optimize rows with parallel threads
    if (idx >= 1 && idx <= N) {
        // Copy first real row to bottom extra row
        cells[(N+2)*(N+1)+idx] = cells[(N+2)+idx];
        // Copy last real row to top extra row
        cells[idx] = cells[(N+2)*N + idx];
    }
    
    // Optimize columns with parallel threads
    if (idx >= 0 && idx <= N+1) {
        // Copy first real column to right last extra column
        cells[idx*(N+2)+N+1] = cells[idx*(N+2)+1];
        // Copy last real column to left last extra column
        cells[idx*(N+2)] = cells[idx*(N+2) + N];
    }
}