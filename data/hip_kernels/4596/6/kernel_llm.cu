#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(int* D, int* q, int k) {
    // Use shared memory for common element accesses
    extern __shared__ int shared_mem[];
    int* sD = shared_mem;
    
    // Find index of i row and j column of the distance array
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Load current matrix row and column into shared memory
    int index_ik = i * N + k;
    int index_kj = k * N + j;
    int Dij = i * N + j;

    __syncthreads();
    
    if (D[Dij] > D[index_ik] + D[index_kj]) {
        D[Dij] = D[index_ik] + D[index_kj];
        q[Dij] = k;
    }
}