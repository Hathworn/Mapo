#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void calcpi(int threads, long n, double *results) {
    int rank = threadIdx.x + blockIdx.x * blockDim.x; // Use global index for rank
    if (rank >= threads) return; // Boundary check to avoid out-of-bounds access

    results[rank] = 0.0;
    double step = 1.0 / n;
    double x = 0.0;

    long lower = rank * n / threads;
    long upper = (rank + 1) * n / threads;

    for (long i = lower; i < upper; i++) {
        x = (i + 0.5) * step;
        results[rank] += 4.0 / (1.0 + x * x);
    }
    results[rank] *= step; // Apply step scaling to result
}