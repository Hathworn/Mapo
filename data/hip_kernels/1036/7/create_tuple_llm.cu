#include "hip/hip_runtime.h"
#include "includes.h"
double* x;
int numSMs;

__global__ void create_tuple(double* devx, int* pos_x, int* pos_y, double* value, int N) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if (index < N) {
        pos_x[index] = index;
        pos_y[index] = index;
        value[index] = 2 * cosf(2 * devx[index]);
    }
    else if (index == N) {
        pos_x[index] = N;  // Ensure boundary condition for last element
    }
}