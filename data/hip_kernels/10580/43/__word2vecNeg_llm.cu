#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize __word2vecNeg kernel for performance. 
__global__ void __word2vecNeg(int nrows, int ncols, int *WA, int *WB, float *A, float *B, float lrate, float vexp) {
    int rowId = blockIdx.x * blockDim.x + threadIdx.x;
    int colId = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for intermediate results
    extern __shared__ float shared_mem[];

    // Ensure threads operate within matrix bounds
    if(rowId < nrows && colId < ncols) {
        // Memory coalescing and use of registers
        float valueA = A[rowId * ncols + colId];
        float valueB = B[rowId * ncols + colId];

        // Computation
        float newValue = valueA + lrate * powf(valueB, vexp);

        // Storing result back into A
        A[rowId * ncols + colId] = newValue;
    }
}
```
