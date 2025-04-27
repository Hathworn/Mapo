#include "hip/hip_runtime.h"
#include "includes.h"

#define N 24

__global__ void muestraIndice(float *a, float *b, float *c){

    int global = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize shared memory for computations to potentially reduce fetch latency
    __shared__ float shared_a[blockDim.x];
    __shared__ float shared_b[blockDim.x];

    if(global < N){
        shared_a[threadIdx.x] = threadIdx.x;
        shared_b[threadIdx.x] = blockIdx.x;
        c[global] = global;

        // Copy computed data from shared memory to global memory
        a[global] = shared_a[threadIdx.x];
        b[global] = shared_b[threadIdx.x];
    }
}