#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

// Optimized kernel using 2D grid and block
__global__ void grads_w2_kernel(double * grads_W2, double * W2, double reg, int size) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (i < size && j < size) { // Check bounds
        grads_W2[i * size + j] += W2[i * size + j] * reg;
    }
}