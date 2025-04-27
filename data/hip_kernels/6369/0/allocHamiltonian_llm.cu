#include "hip/hip_runtime.h"
#include "includes.h"

// Global kernel function to allocate Hamiltonian
__global__ void allocHamiltonian(float* devMat, float* devSpins, int index, int size, double* energyTempor) {
    int wIndex = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize loop by precomputing index offsets and utilizing shared memory if beneficial
    while (wIndex < size * size) {
        int i = wIndex % size;
        int j = wIndex / size;  // Avoid explicit casting to int for performance
        double spinProduct = (double)(devSpins[i + index * size] * devSpins[j + index * size]);
        energyTempor[wIndex] = spinProduct * devMat[wIndex];
        wIndex += blockDim.x * gridDim.x;
    }
}