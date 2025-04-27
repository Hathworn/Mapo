```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_ASM(float *norm, float *ASM, float *mulMatrix, int Max) {
    // Calculate global row and column index
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if we are within the bounds
    if (row < Max && col < Max) {
        
        // Accumulate results for a single element using shared memory
        float sum = 0.0f;
        for (int k = 0; k < Max; k++) {
            sum += norm[row * Max + k] * norm[k * Max + col];
        }
        
        // Store the result atomically
        atomicAdd(&mulMatrix[row * Max + col], sum);
    }
    
    // Use a single thread to accumulate ASM
    if (col == 0 && row == 0) {
        float asmSum = 0.0f;
        // Atomic addition over ASM array
        for (int i = 0; i < Max * Max; i++) {
            atomicAdd(&asmSum, mulMatrix[i]);
        }
        atomicAdd(&ASM[0], asmSum);
        printf("ASM %f\n", ASM[0]);
    }
}