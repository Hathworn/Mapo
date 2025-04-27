#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalization(int *glcm, float *norm, int Max, int sum) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * Max + ix;

    // Utilize shared memory to improve performance
    __shared__ int localGlcm;
    __shared__ float localSum;

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        localSum = float(sum);
    }

    if (idx < (Max + 1) * (Max + 1)) {
        localGlcm = glcm[idx];
        __syncthreads(); // Synchronize threads after updating shared memory

        // Use shared memory for normalization
        norm[idx] = float(localGlcm) / localSum;
    }
}