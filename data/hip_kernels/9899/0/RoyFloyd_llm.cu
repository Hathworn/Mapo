#include "hip/hip_runtime.h"
#include "includes.h"

#define INF 1000000

using namespace std;

__global__ void RoyFloyd(int* matrix, int k, int N)
{
    int i = blockDim.y * blockIdx.y + threadIdx.y;
    int j = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < N && j < N) { // Ensure indices are within bounds
        int ik = matrix[i * N + k];
        int kj = matrix[k * N + j];
        int ij = matrix[i * N + j];

        if (ik != INF && kj != INF && ik + kj < ij) {
            matrix[i * N + j] = ik + kj; // Update the matrix element if a shorter path is found
        }
    }
}