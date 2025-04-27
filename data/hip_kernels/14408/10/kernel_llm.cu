#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *A, int *B, int *counter, int n) {
    int tid = threadIdx.x;

    // Ensure shared memory is utilized to reduce global memory access time
    extern __shared__ int sharedCounter[];

    if (tid < n) {
        for (int j = 0; j < n; j++) {
            sharedCounter[tid * n + j] = counter[tid * n + j];
            sharedCounter[tid * n + j]++;  // Increment in shared memory
            A[tid * n + j] = B[tid * n + j];
            counter[tid * n + j] = sharedCounter[tid * n + j];  // Write back to global memory
        }
    }
}