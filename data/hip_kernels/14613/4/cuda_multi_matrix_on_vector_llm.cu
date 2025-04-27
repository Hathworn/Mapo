#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_multi_matrix_on_vector(int *matrix, int *vector, int *new_vector, int numElements) {
    __shared__ int cache[threadsPerBlock];
    const int idx = blockDim.x * blockIdx.x + threadIdx.x; // Global index
    const int tIdx = threadIdx.x; // Thread index
    const int k = (numElements + threadsPerBlock - 1) / threadsPerBlock; // Number of chunks based on threads per block

    // Optimize loop by minimizing data transfer and improving thread utilization
    for (int i = 0; i < k; i++) {
        if (tIdx + threadsPerBlock * i < numElements) {
            cache[tIdx] = vector[tIdx + threadsPerBlock * i]; // Load chunk of vector into shared memory
        }
        __syncthreads();

        int min = numElements - i * threadsPerBlock;
        min = min > threadsPerBlock ? threadsPerBlock : min; // Determine min to handle leftover elements

        if (idx < numElements) {
            int temp = 0; // Use temp variable to accumulate results
            for (int j = 0; j < min; j++) {
                temp += cache[j] * matrix[(i * threadsPerBlock + j) * numElements + idx];
            }
            atomicAdd(&new_vector[idx], temp); // Use atomicAdd to avoid race conditions
        }
        __syncthreads();
    }
}