#include "hip/hip_runtime.h"
#include "includes.h"

static unsigned int GRID_SIZE_N;
static unsigned int GRID_SIZE_4N;
static unsigned int MAX_STATE_VALUE;

__global__ static void cudaPreTTGammaKernel(double *tipVector, double *l, double *r, double *umpX1, double *umpX2)
{
    __shared__ volatile double ump[64];
    const int tid = threadIdx.y * 4 + threadIdx.x;
    double tipValue = tipVector[4 * blockIdx.x + threadIdx.x];
    
    // Use conditional operator to eliminate branch divergence
    ump[tid] = tipValue * (blockIdx.y == 0 ? l[tid] : r[tid]);
    
    __syncthreads();
    
    // Use cooperative thread reduction for better performance
    if (threadIdx.x < 2) ump[tid] += ump[tid + 2];
    __syncthreads();
    
    if (threadIdx.x == 0) {
        ump[tid] += ump[tid + 1];
        if (blockIdx.y == 0) {
            umpX1[blockIdx.x * 16 + threadIdx.y] = ump[tid];
        } else {
            umpX2[blockIdx.x * 16 + threadIdx.y] = ump[tid];
        }
    }
}