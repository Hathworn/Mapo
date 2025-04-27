#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void x_batch_kernel(double* X_batch, double * X, int * sample_indices, int size) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Compute global thread index
    if (i < size * gridDim.x) {                      // Check index within bounds
        int sample_idx = i / size;                   // Compute sample index
        int feature_idx = i % size;                  // Compute feature index
        X_batch[i] = X[sample_indices[sample_idx] * size + feature_idx];
    }
}