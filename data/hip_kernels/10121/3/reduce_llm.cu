#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(int *g_idata, int searchedNumber, int *ok) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by removing unnecessary synchronization
    if (g_idata[i] == searchedNumber) {
        printf("Found %d on %d position %d", searchedNumber, i, *ok);
        *ok = i; // This assignment may cause race conditions if multiple threads find 'searchedNumber'
    }
}