#include "hip/hip_runtime.h"
#include "includes.h"

#define R 4176
#define C 2048
#define N (R*C)
const int threadsPerBlock = 1024;
const int blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;

using namespace std;

hipError_t matrixOperation(double* c, const double* a, const double* b, unsigned int arrSize, int operation, float* kernel_runtime, float* GPU_transfer_time);
void CPUMatrixOperation(double* c, const double* a, const double* b, unsigned int arrSize, int operation);
long long start_timer();
long long stop_timer(long long start_time, const char *name);

// Optimized kernel to improve performance
__global__ void matrixSubtractKernel(double* c, const double* a, const double* b) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int total_threads = blockDim.x * gridDim.x;
    for (; tid < N; tid += total_threads) {
        c[tid] = a[tid] - b[tid];
    }
}