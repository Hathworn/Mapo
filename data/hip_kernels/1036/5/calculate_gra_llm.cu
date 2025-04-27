#include "hip/hip_runtime.h"
#include "includes.h"

double* x;
int numSMs;

__device__ double sqr(double x) {
    return x * x;
}

__global__ void calculate_gra(double* devx, double* gra, int size) {
    // Use shared memory for faster access and reduce global memory interactions
    extern __shared__ double shared_devx[];
    
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index < size) {
        shared_devx[threadIdx.x] = devx[index];
        __syncthreads(); // Ensure all threads have written to shared memory
        
        int pre = index - 1;
        if (pre < 0) pre += size;
        int next = index + 1;
        if (next >= size) next -= size;
        
        // Access through shared memory if within bounds
        double devx_pre = (threadIdx.x > 0) ? shared_devx[threadIdx.x - 1] : devx[pre];
        double devx_next = (threadIdx.x < blockDim.x - 1) ? shared_devx[threadIdx.x + 1] : devx[next];
        
        gra[index] = devx_pre * sin(2.0 * devx[index] * devx_pre) + devx_next * sin(2.0 * devx[index] * devx_next);
        printf("gra %d %d %d %f %f %f\n", pre, index, next, sqr(devx[index]), devx_pre * sin(2.0 * devx[index] * devx_pre), gra[index]);
    }
}