#include "hip/hip_runtime.h"
#include "includes.h"
#define CUDAMAXTHREADPERBLOCK 1024
#define CUDAMAXBLOCK 65536

using namespace std;

__global__ void kernelAddConstant(int *g_a, const int b)
{
    // Calculate the global index for the thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if index is within bounds to prevent accessing out of bounds memory
    if (idx < CUDAMAXBLOCK * CUDAMAXTHREADPERBLOCK) {
        g_a[idx] += b;
    }
}