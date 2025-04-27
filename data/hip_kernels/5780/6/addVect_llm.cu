#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addVect(int *vect1, int *vect2, int *resultVect) {
    // Use local thread index with grid-stride loop for better access pattern and work distribution
    for (int i = threadIdx.x + blockDim.x * blockIdx.x; i < N; i += blockDim.x * gridDim.x) {
        resultVect[i] = vect1[i] + vect2[i];
    }
}