
```cpp
#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCKSIZE 4
#define CELLS_PER_THREAD 4     // Stride length
__global__ void ShortestPath3(float *Arr1, float *Arr2, int N) {
    // Arr1 input array, holds weights
    // Arr2 output array
    unsigned int k;
    int row = blockIdx.x;
    int col = threadIdx.x;

    if (row >= N || col >= N) return;

    int index = row * N + col;                     // Index for elements of global memory array
    extern __shared__ float sArr[];                // Dynamic shared memory allocation in array
    int stride = threadIdx.x;                      // Adjust stride to threadIdx.x

    for (int i = 0; i < N; i++) {                  // Copy elements of the same row to shared memory
        if (i + stride * CELLS_PER_THREAD >= N) break; 
        sArr[i + stride * CELLS_PER_THREAD] = Arr1[index + i * N / CELLS_PER_THREAD];
    }
    __syncthreads();                                // Wait for all threads in the current block

    for (int i = 0; i < N; i++) {                  // Iterate through shared elements
        if (i == threadIdx.x + stride * CELLS_PER_THREAD) continue;
        if (sArr[threadIdx.x + stride * CELLS_PER_THREAD] > (sArr[i] + Arr1[i * N + col + stride * CELLS_PER_THREAD])) {
            Arr2[index + stride * CELLS_PER_THREAD] = (sArr[i] + Arr1[i * N + col + stride * CELLS_PER_THREAD]);
        }
    }
}