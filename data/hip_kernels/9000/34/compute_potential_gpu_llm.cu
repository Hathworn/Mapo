#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_potential_gpu(float *m, float *x, float *y, float *z, float *phi, int N, int N1) {
    // Define shared memory for block calculations
    extern __shared__ float sharedMem[];
    float *sharedX = sharedMem;
    float *sharedY = sharedX + blockDim.x;
    float *sharedZ = sharedY + blockDim.x;

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    float xi, yi, zi, potential = 0.0f;
    
    if (i < (N1 == 0 ? N : N1)) {
        xi = x[i];
        yi = y[i];
        zi = z[i];
        
        for (int tile = 0; tile < (N + blockDim.x - 1) / blockDim.x; tile++) {
            int j = tile * blockDim.x + threadIdx.x;
            if (j < N) {
                // Load data into shared memory
                sharedX[threadIdx.x] = x[j];
                sharedY[threadIdx.x] = y[j];
                sharedZ[threadIdx.x] = z[j];
            }
            __syncthreads(); // Synchronize to ensure complete load
            
            for (int k = 0; k < blockDim.x; k++) {
                int idx = tile * blockDim.x + k;
                if (idx < N && i != idx) {
                    float rijx = xi - sharedX[k];
                    float rijy = yi - sharedY[k];
                    float rijz = zi - sharedZ[k];
                    potential -= m[idx] / sqrtf(rijx * rijx + rijy * rijy + rijz * rijz);
                }
            }
            __syncthreads(); // Synchronize to prepare for next tile
        }
        phi[i] = potential;
    }
}