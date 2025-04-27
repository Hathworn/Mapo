#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PreInitialize(int size, unsigned int *randoms, int *bestSeen, int *origin, int *mis) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop stride pattern for increased parallel efficiency
    for (int i = idx; i < size; i += blockDim.x * gridDim.x) {
        // Set the origin to be self
        origin[i] = i;

        // Set MIS to be -1;
        mis[i] = -1;

        // Set the bestSeen value to be random
        bestSeen[i] = randoms[i] % 1000000;
    }
}