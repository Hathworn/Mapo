#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline void charAtomicAdd(char *address, char value) {
    int oldval, newval, readback;
    oldval = *address;
    newval = oldval + value;
    while ((readback = atomicCAS((int *)address, oldval, newval)) != oldval) {
        oldval = readback;
        newval = oldval + value;
    }
}

__global__ void kernel_add(char* newB, char* first, char* second, int size_biggest, int diff, int* size_newB) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;  // Use global index for larger grid sizes
    if (i >= size_biggest) return;  // Avoid out-of-bounds access

    int tmp = 0;
    
    if (i == 0 || i - 1 - diff < 0 || (second[i - 1 - diff] == '+' || second[i - 1 - diff] == '-')) {
        if (first[i - 1] != '+' && first[i - 1] != '-') {
            tmp = first[i - 1];
        }
    } else {
        tmp = second[i - 1 - diff] + first[i - 1];
    }

    if (tmp >= 10) {
        atomicAdd(&newB[i - 1], 1);  // Use atomicAdd for correctness
        tmp %= 10;
    }

    atomicAdd(&newB[i], tmp);  // Use atomicAdd for concurrent writes correction
}