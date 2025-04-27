#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inputKernel(float *x, int n, int N)
{
    // Compute global thread IDs
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = iy * NUM_OF_X_THREADS + ix;
    
    // Use shared memory for temporary storage if needed
    // __shared__ float temp[NUM_OF_X_THREADS * blockDim.y];

    if (idx < N) // Check if within bounds
    {
        // Initialize x[idx * N] or x[idx]
        x[idx*N] = (idx < n) ? (float)idx : 0;

        int i;
        for(i=1; i<N; i++)
        {
            x[idx*N + i] = 0; // Zero-fill other elements in the row
        }
    }
}