#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(int *arr, int sqroot, int limit) {
    // Compute a unique index for each thread
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Parallelize outer loop by assigning threads per value of c
    for (int c = 2; c <= sqroot; c++) {
        if (arr[c] == 0) {
            int m = c + 1 + tid;
            if (m < limit && m % c == 0) {
                arr[m] = 1;
            }
        }
    }
}