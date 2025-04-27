#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initSquare(float* a, float* x, float totalX, int n, int ghosts) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int index;
    
    // Unrolling the loop for better performance
    for (int j = 0; (index = blockDim.x * j + i) < n; j++) {
        if (index > n / 3 && index < 2 * n / 3)
            a[index + ghosts] = 1.5f;
        else
            a[index + ghosts] = 0.5f;
    }
    
    if (i == 0) { // Only one thread handles the boundary conditions
        for (int j = 0; j < ghosts; j++) {
            a[j] = a[j + n];
            a[n + ghosts + j] = a[ghosts + j];
            // Removing commented out code for clarity
        }
    }
}