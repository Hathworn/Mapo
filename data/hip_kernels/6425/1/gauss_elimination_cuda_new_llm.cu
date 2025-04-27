#include "hip/hip_runtime.h"
#include "includes.h"

// Define maximum size for shared memory
#define MAXSIZE 1024 

__global__ void gauss_elimination_cuda_new(float *a_d, float *b_d, int size) {
    int idy = threadIdx.x;

    // Use dynamic shared memory for flexibility
    extern __shared__ float temp[];

    // Each thread loads its row from global to shared memory
    for (int i = 0; i < size+1; i++) {
        temp[idy * (size+1) + i] = a_d[(idy * (size+1)) + i];
    }
    __syncthreads();

    // Perform Gaussian elimination
    for (int i = 1; i < size; i++) {
        if (idy >= i) {
            float factor = temp[idy * (size+1) + (i-1)] / temp[(i-1) * (size+1) + (i-1)];
            
            // Optimize loop to avoid boundary checking
            for (int j = i-1; j < size+1; j++) {
                temp[idy * (size+1) + j] -= temp[(i-1) * (size+1) + j] * factor;
            }
        }
        __syncthreads();
    }

    // Each thread writes its row back to global memory
    for (int i = 0; i < size+1; i++) {
        b_d[idy * (size+1) + i] = temp[idy * (size+1) + i];
    }
}