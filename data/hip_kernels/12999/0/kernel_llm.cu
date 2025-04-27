#include "hip/hip_runtime.h"
#include "includes.h"

// Global variables
int N = 93, dimx = 1920, dimy = 2560, tam_imag = 1920 * 2560;

// Kernel function
__global__ void kernel(float *max, float *var, int *top, int k) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Unroll comparison and assignment for better performance
    if (idx < tam_imag && var[idx] > max[idx]) {
        top[idx] = k;
        max[idx] = var[idx];
    }
}

// Additional functions can go here
float *leerMatrizVarianza(int d);