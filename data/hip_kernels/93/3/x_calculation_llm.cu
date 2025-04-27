#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256  // Define a constant block size for better occupancy

char* concat(char *s1, char *s2);

__global__ void x_calculation(float *x, float *r, float *r_squared, int size) {
    // Use shared memory to minimize global memory access
    __shared__ float alpha_shared;
    if (threadIdx.x == 0) {
        alpha_shared = r_squared[0];
    }
    __syncthreads();

    int index = blockDim.x * blockIdx.x + threadIdx.x;
    if (index < size) {
        x[index] += alpha_shared * r[index];
    }
}