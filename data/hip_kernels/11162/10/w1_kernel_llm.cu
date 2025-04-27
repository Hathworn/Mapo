#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void w1_kernel(double * grads_W1, double * W1, double learning_rate, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate 1D global thread index
    if (idx < size) { // Check bounds
        W1[idx] += (-learning_rate * grads_W1[idx]); // Update weights
    }
}