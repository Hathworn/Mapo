#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void initArray(uint32_t *path, double *approx, uint32_t *top_k, int n) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use a single if statement and directly access arrays using `index`
    if (index < n) {
        approx[index]++;
        top_k[index] = path[index];
        path[index]++;
    }
}