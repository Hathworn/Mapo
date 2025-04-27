#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeProjection(float *eT, float *e, float *eigenvec, int *indices, int M, int N) {
    // Calculate the indices only once
    int elementNum = blockIdx.x * blockDim.x + threadIdx.x;
    if (elementNum >= M * N) {
        return;
    }
    
    int m = elementNum / N;
    int n = elementNum % N;

    // Calculate global index for reuse
    int globalIndex = n * M + m;
    int eigenvecIndex = n * M + indices[m];

    // Use globalIndex for setting both e and eT
    float val = eigenvec[eigenvecIndex];
    e[globalIndex] = val;
    eT[m * N + n] = val;
}