#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(int *arr, int sqroot, int limit) {
    int c;
    for(c = 2; c <= sqroot; c++) {
        if(arr[c] == 0) {
            // Calculate thread's global index
            int tid = c + 1 + threadIdx.x + (blockIdx.x * blockDim.x);
            
            // Ensure within limit and mark as 1 if divisible by c
            for (int m = tid; m < limit; m += blockDim.x * gridDim.x) {
                if (m % c == 0) {
                    arr[m] = 1;
                }
            }
        }
    }
}