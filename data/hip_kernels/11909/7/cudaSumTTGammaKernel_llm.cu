```c
#include "hip/hip_runtime.h"
#include "includes.h"

static unsigned int GRID_SIZE_N;
static unsigned int GRID_SIZE_4N;
static unsigned int MAX_STATE_VALUE;

__global__ static void cudaSumTTGammaKernel(unsigned char *tipX1, unsigned char *tipX2, double *tipVector, double *sumtable, int limit) {
    // Calculate global thread index
    const int n = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return if out of bounds
    if (n >= limit) {
        return;
    }
    
    const int i = n / 4;
    const int j = n % 4;
    
    // Use shared memory for intermediate results
    extern __shared__ double sharedMemory[];
    double *sh_left = sharedMemory + threadIdx.x * 8; // temporary storage for left and right
    double *sh_right = sh_left + 4;
    
    // Load from global memory to shared memory
    double *left = &(tipVector[4 * tipX1[i]]);
    double *right = &(tipVector[4 * tipX2[i]]);
    #pragma unroll
    for (int k = 0; k < 4; k++) {
        sh_left[k] = left[k];
        sh_right[k] = right[k];
    }
    
    // Synchronize threads to ensure shared memory is ready
    __syncthreads();
    
    double *sum = &sumtable[i * 16 + j * 4];
    
    // Calculate sums with optimized instructions
    #pragma unroll
    for (int k = 0; k < 4; k++) {
        sum[k] = sh_left[k] * sh_right[k];
    }
}