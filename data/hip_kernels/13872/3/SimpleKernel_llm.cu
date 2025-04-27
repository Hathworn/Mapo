#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SimpleKernel(int N, float* a){
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a register for the repeated value
    if (idx < N) {
        float temp = a[idx]; // Cache the initial value
        for (int x = 0; x < 1000; x++) {
            temp = asin(temp + x); // Use the register instead of global memory
        }
        a[idx] = temp; // Write back to global memory only once
    }
}