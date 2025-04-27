#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixColour (float *a, float *b, int n) {
    int j = blockDim.x * blockIdx.x + threadIdx.x;

    // Remove unnecessary prints to reduce overhead
    // printf("Block = %d ; Thread = %d \n", blockIdx.x+1, threadIdx.x+1);

    int *colour = new int[n];
    memset(colour, 0, n * sizeof(int));

    if (j < n) {
        for (int i = 0; i < n; i++) {
            // printf("Block = %d ; Thread = %d First For i = %d\n", blockIdx.x+1, threadIdx.x+1, i+1);
            if (a[j * n + i] == 1 && b[i] != -1) {
                colour[(int)b[i]] = 1;
            }
        }

        for (int i = 0; i < n; i++) {
            if (colour[i] == 0) {
                // atomic operations should be minimized; use directly if possible
                b[j] = (float)i;
                // printf("Block = %d ; Thread = %d Second For i = %d\n", blockIdx.x+1, threadIdx.x+1, i+1);
                break;
            }
        }
    }

    delete[] colour;
}