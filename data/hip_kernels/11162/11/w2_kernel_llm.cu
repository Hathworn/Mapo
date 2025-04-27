#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void w2_kernel(double *grads_W2, double *W2, double learning_rate, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute unique index for elements
    if (idx < size * size) { // Ensure index is within bounds
        W2[idx] += -learning_rate * grads_W2[idx]; // Update W2
    }
}