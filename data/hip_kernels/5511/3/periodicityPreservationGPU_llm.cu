#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void periodicityPreservationGPU(int N, char *cells)
{
    // Calculate once and reuse
    int stride = N + 2;
    
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize using parallel threads
    if (tid <= N)
    {
        // Copy first real row to bottom extra row
        cells[stride * (N + 1) + tid + 1] = cells[stride + tid + 1];

        // Copy last real row to top extra row
        cells[tid + 1] = cells[stride * N + tid + 1];
    }
    
    if (tid <= N + 1)
    {
        // Copy first real column to right last extra column
        cells[tid * stride + N + 1] = cells[tid * stride + 1];

        // Copy last real column to left last extra column
        cells[tid * stride] = cells[tid * stride + N];
    }
}