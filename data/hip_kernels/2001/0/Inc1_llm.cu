#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

// Optimized kernel function
__global__ void Inc1(float *Ad, float *Bd){
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    // Check for bounds and limit the active thread
    if(tx == 0){
        float a = Ad[tx]; // Load value once to register
        for(int i = 0; i < ITER; i++){
            a += 1.0f; // Increment in register
            // Reduce unnecessary access by using a register variable
            float temp = a;
            for(int j = 0; j < 256; j++){
                Bd[tx] = temp;
            }
        }
        Ad[tx] = a; // Store the incremented value back to memory once
    }
}