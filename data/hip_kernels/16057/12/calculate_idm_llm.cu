#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_idm(float *norm, float *idm, int *dif, int max, float sum, int size) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    int tid = threadIdx.x;

    if (idx < size) {
        // Calculate individual idm values using shared memory for faster memory access
        float idm_value = ((float(1) / (1 + dif[idx])) * norm[idx]);

        __shared__ float shared_idm[1024];
        shared_idm[tid] = idm_value;
        __syncthreads();

        // Perform parallel reduction on shared memory for optimized summation
        for (int stride = 1; stride < blockDim.x; stride *= 2) {
            if ((tid % (2 * stride)) == 0 && (tid + stride) < blockDim.x) {
                shared_idm[tid] += shared_idm[tid + stride];
            }
            __syncthreads();
        }

        // Store the result back to global memory
        if (tid == 0) {
            atomicAdd(&idm[ix], shared_idm[0]);  // Ensure atomic addition to handle concurrent writes
        }
    }

    if (idx == 0) {
        printf("idm %f\n", idm[0]);
    }
}