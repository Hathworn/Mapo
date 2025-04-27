```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_idm(float *norm, float *idm, int *dif, int max, float sum, int size) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    int tid = threadIdx.x;

    if (idx < size) {
        // Compute intermediate IDM value
        idm[idx] = ((float(1) / (1 + dif[idx])) * norm[idx]);
    }
    __syncthreads(); // Ensure all threads have computed idm[idx]

    // Optimized reduction with loop unrolling
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride && (idx + stride) < size) {
            idm[idx] += idm[idx + stride];
        }
        __syncthreads();
    }

    // Print result from the first thread of the first block
    if (idx == 0) {
        printf("idm %f\n", idm[0]);
    }
}