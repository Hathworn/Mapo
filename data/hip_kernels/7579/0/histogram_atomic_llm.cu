#include "hip/hip_runtime.h"
#include "includes.h"

#define DATA_SIZE (1024 * 1024 * 256)
#define DATA_RANGE (256)

void printHist(int * arr, char * str);

__global__ void histogram_atomic(float * a, int * histo, int n) {
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (tid < n) {
        // Use atomic operation to safely update histogram
        atomicAdd(&histo[(int)a[tid]], 1);
    }
}