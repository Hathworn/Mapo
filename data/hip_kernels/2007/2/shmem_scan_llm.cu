#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void shmem_scan(float* d_out, float* d_in) {
    extern __shared__ float sdata[];
    int idx = threadIdx.x;

    // Load input into shared memory
    sdata[idx] = d_in[idx];
    __syncthreads();

    // Optimize loop by using shared memory directly and avoiding redundant checks
    for (int interpre = 1; interpre < blockDim.x; interpre *= 2) {
        float temp = 0.0f;
        if (idx >= interpre) {
            temp = sdata[idx] + sdata[idx - interpre];
        }
        __syncthreads();
        if (idx >= interpre) {
            sdata[idx] = temp;
        }
        __syncthreads();
    }

    // Write result to global memory
    d_out[idx] = sdata[idx];
}