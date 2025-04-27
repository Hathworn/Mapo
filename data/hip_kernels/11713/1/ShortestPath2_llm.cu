#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCKSIZE 4
#define CELLS_PER_THREAD 4     // Stride length
__global__ void ShortestPath2(float *Arr1, float *Arr2, int N) {
    unsigned int k;

    int row = blockIdx.x;
    int col = threadIdx.x;
    if (row >= N || col >= N) return;

    int index = row * N + col;                  // Index for Elements of global memory array
    extern __shared__ float sArr[];             // Dynamic share memory allocation in Array
    sArr[col] = Arr1[index];                    // Copy elements of same ROW in shared memory (ThreadIdx.x as index)
    __syncthreads();                            // Wait threads in block to finish

    float current = sArr[col];
    for (k = 0; k < N; k++) {
        if (k == col) continue;                 // Skip self
        float newPath = sArr[k] + Arr1[k * N + col];
        if (current > newPath) {                // Update if new path is shorter
            current = newPath;
        }
    }
    Arr2[index] = current;                      // Write the shortest path to output
}