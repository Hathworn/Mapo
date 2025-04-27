#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc1(float *Ad, float *Bd){
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if(tx < 1 ){
        float localA = Ad[tx]; // Local variable for Ad[tx], reducing memory access
        for(int i = 0; i < ITER; i++){
            localA += 1.0f; // Use the local variable
            for(int j = 0; j < 256; j++){
                Bd[tx] = localA; // Use the result from the local variable
            }
        }
        Ad[tx] = localA; // Update Ad[tx] with the optimized result
    }
}