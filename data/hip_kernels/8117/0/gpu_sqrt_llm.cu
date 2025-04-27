#include "hip/hip_runtime.h"
#include "includes.h"

long N = 6400000000;
int doPrint = 0;

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// HELPER CODE TO INITIALIZE, PRINT AND TIME
struct timeval start, end;

__global__ void gpu_sqrt(float* a, long N) {
    long element = blockIdx.x * blockDim.x + threadIdx.x;
    long stride = gridDim.x * blockDim.x; // Calculate stride for each block
    for (long i = element; i < N; i += stride) {
        a[i] = sqrt(a[i]); // Efficient global memory access with coalescing
    }
}