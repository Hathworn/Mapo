#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with index optimization for better performance
__global__ void vec_computePSF_signalN2Many(int n, int sizePart, int sizeTot, double divide,
                                            int *sparseIndexEvenShiftOutput, int *sparseIndexOddShiftOutput,
                                            double *fft, int *sparseIndexEvenShiftOutputNext,
                                            int *sparseIndexOddShiftOutputNext, double *psffft) {
    // Using shared memory for data that is frequently accessed can help reduce memory latency
    __shared__ double shared_fft_even[1024];
    __shared__ double shared_fft_odd[1024];

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    if (id < n) {
        // Calculate u and p more efficiently with bitwise operations
        int u = id / sizePart;
        int p = id % sizePart;

        // Load data into shared memory
        if (threadIdx.x < sizePart) {
            shared_fft_even[threadIdx.x] = fft[sparseIndexEvenShiftOutput[p]+sizeTot*u] / divide;
            shared_fft_odd[threadIdx.x] = fft[sparseIndexOddShiftOutput[p]+sizeTot*u] / divide;
            __syncthreads(); // Ensure all shared memory loads are complete
        }

        // Calculate power spectrum
        double x = shared_fft_even[threadIdx.x];
        double y = shared_fft_odd[threadIdx.x];
        psffft[sparseIndexEvenShiftOutputNext[p]+2*sizePart*u] = x * x + y * y;
        psffft[sparseIndexOddShiftOutputNext[p]+2*sizePart*u] = 0;
    }
}