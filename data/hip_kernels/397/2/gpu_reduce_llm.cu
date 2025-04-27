```c
#include "hip/hip_runtime.h"
#include "includes.h"

typedef struct {
    int y;
    int x;
} Antena;

#define m(y,x) mapa[ (y * cols) + x ]

#define TAMBLOCK 128

__global__ void gpu_reduce(int *c, int size)
{
    // Calculate global thread ID
    int position = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds
    if (position < size / 2) {
        // Reduce using threads efficiently
        if (c[position] < c[position + size / 2]) {
            c[position] = c[position + size / 2];
        }
    }

    // Handle case where size is odd separately
    if (position == 0 && size % 2 != 0) {
        if (c[0] < c[size - 1]) {
            c[0] = c[size - 1];
        }
    }
}