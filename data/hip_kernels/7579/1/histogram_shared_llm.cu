#include "hip/hip_runtime.h"
#include "includes.h"

#define DATA_SIZE (1024 * 1024 * 256)
#define DATA_RANGE (256)

void printHist(int * arr, char * str);

__global__ void histogram_shared(float * a, int * histo, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ int sh[DATA_RANGE];

    // Initialize shared memory with one warp
    for (int i = threadIdx.x; i < DATA_RANGE; i += blockDim.x) {
        sh[i] = 0;
    }
    __syncthreads();

    // Accumulate histogram counts in shared memory
    if (tid < n) {
        atomicAdd(&sh[(int)a[tid]], 1);
    }
    __syncthreads();

    // Write shared memory counts to global memory
    for (int i = threadIdx.x; i < DATA_RANGE; i += blockDim.x) {
        atomicAdd(&histo[i], sh[i]);
    }
}