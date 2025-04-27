#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_computePSF_signalN(int n, double *result, double divide, int *sparseIndexEvenShiftOutput, int *sparseIndexOddShiftOutput, double *fft) {
    int id = threadIdx.x + blockIdx.x * blockDim.x + 
             (threadIdx.y + blockIdx.y * blockDim.y) * gridDim.x * blockDim.x;

    // Optimize by eliminating redundant computation of `id`
    if (id < n) {
        double x = fft[sparseIndexEvenShiftOutput[id]] / divide;
        double y = fft[sparseIndexOddShiftOutput[id]] / divide;
        result[id] = x * x + y * y;
    }
}