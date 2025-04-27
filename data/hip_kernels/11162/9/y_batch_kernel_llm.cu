#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void y_batch_kernel(double* y_batch, double* y, int* sample_indices, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < size) { // Ensure thread is within bounds
        y_batch[i] = y[sample_indices[i]];
    }
}