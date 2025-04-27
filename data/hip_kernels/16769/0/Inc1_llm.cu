#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc1(float *Ad, float *Bd){
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if(tx < 1 ){
        float a = Ad[tx];
        for(int i = 0; i < ITER; i++){
            a = a + 1.0f;
        }
        Ad[tx] = a; // Write back to global memory once
        float b = a;
        for(int j = 0; j < 256; j++){
            Bd[tx] = b; // Remove dependency on external loop
        }
    }
}