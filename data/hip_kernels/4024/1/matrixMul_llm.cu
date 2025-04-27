#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMul(int *a, int *b, int *c, int size){
    // Calculate unique global thread indices
    int my_x = blockIdx.x * blockDim.x + threadIdx.x;
    int my_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check to ensure within matrix bounds
    if (my_x < size && my_y < size) {
        int local_c = 0;
        // Loop unrolling optimization could be here if we know size is divisible
        for (int i = 0; i < size; i++) {
            local_c += a[my_x * size + i] * b[i * size + my_y];
        }
        // Assign the result to the matrix c
        c[my_x * size + my_y] = local_c;
    }
}