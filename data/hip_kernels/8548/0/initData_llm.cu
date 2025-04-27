#include "hip/hip_runtime.h"
#include "includes.h"

#define BLKX 32
#define BLKY 32

hipStream_t gstream;

__global__ void initData(int nbLines, int M, double *h, double *g)
{
    // Compute unique thread index
    long idX = threadIdx.x + blockIdx.x * blockDim.x;
    long totalSize = nbLines * M;

    // Check if the thread is within bounds
    if (idX >= totalSize) return;

    // Initialize arrays
    h[idX] = 0.0L;
    g[idX] = 0.0L;
    
    // Apply condition and update arrays
    if (idX >= M + 1 && idX < 2 * M - 1) {
        h[idX] = 100.0;
        g[idX] = 100.0;
    }
}