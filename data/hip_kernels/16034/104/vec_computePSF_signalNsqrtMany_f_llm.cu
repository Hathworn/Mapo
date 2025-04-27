#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_computePSF_signalNsqrtMany_f (int n, int sizeSubImage, float *result, float *fft, float divide, int *sparseIndexEvenShift2D, int *sparseIndexOddShift2D) {
    // Use shared memory for better data reuse
    __shared__ float sharedFFT[1024];  // Adjust size as needed

    float x, y;
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;
    int id2 = id % sizeSubImage;
    int id3 = id / sizeSubImage;

    if (id < n) {
        // Load data into shared memory
        int evenIndex = sparseIndexEvenShift2D[id2] + id3 * sizeSubImage * 2;
        int oddIndex = sparseIndexOddShift2D[id2] + id3 * sizeSubImage * 2;
        
        if(threadIdx.x < sizeSubImage * 2) {
            sharedFFT[threadIdx.x] = fft[evenIndex + threadIdx.x] / divide;
            if(threadIdx.x + 1 < sizeSubImage * 2) {
                sharedFFT[threadIdx.x + 1] = fft[oddIndex + threadIdx.x] / divide;
            }
        }

        __syncthreads();  // Ensure all loads are complete

        // Read from shared memory
        x = sharedFFT[sparseIndexEvenShift2D[id2]];
        y = sharedFFT[sparseIndexOddShift2D[id2]];
        result[id] = sqrtf(x * x + y * y);
    }
}