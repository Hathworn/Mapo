#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

const int MAX = 100;

__global__ void Cholesky_GPU(double *matrix, int n) {
    int j = threadIdx.x;

    extern __shared__ double localMatrix[];

    // Load matrix data into shared memory for faster access
    for (int i = 0; i < n; i++) {
        localMatrix[i * n + j] = matrix[i * n + j];
    }
    localMatrix[n * n + j] = 0; // sum column
    __syncthreads();

    // Perform Cholesky decomposition in parallel
    for (int i = 0; i < n; i++) {
        if (j < i) {
            localMatrix[i * n + j] = 0;
        } 
        if (j >= i) {
            double sum = 0; // local sum variable to reduce shared memory usage
            for (int k = 0; k < i; k++) {
                sum += localMatrix[k * n + i] * localMatrix[k * n + j];
            }
            if (i == j) {
                localMatrix[i * n + j] = sqrt(localMatrix[i * n + j] - sum);
            } else if (j > i) {
                localMatrix[i * n + j] = (localMatrix[i * n + j] - sum) / localMatrix[i * n + i];
            }
        }
    }
    __syncthreads();

    // Copy the result back to the global memory
    for (int i = 0; i < n; i++) {
        matrix[i * n + j] = localMatrix[i * n + j];
    }
}