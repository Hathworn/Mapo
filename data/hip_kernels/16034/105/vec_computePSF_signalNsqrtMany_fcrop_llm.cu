#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_computePSF_signalNsqrtMany_fcrop(int n, int sizeSubImage, int sizeSubImageFull, float *result, float *fft, float divide, int *sparseIndexEvenShift2D, int *sparseIndexOddShift2D)
{
    // Calculate global indices for 2D grid
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;

    // Calculate unique global ID for linear access
    int id = idy * gridDim.x * blockDim.x + idx;

    // Precompute offsets
    int id2 = id % sizeSubImage;
    int id3 = id / sizeSubImage;
    int id4 = id3 * sizeSubImageFull;

    if (id < n)
    {
        // Fetch and compute only once, improving efficiency
        float evenIndexVal = fft[sparseIndexEvenShift2D[id2] + id4 * 2];
        float oddIndexVal = fft[sparseIndexOddShift2D[id2] + id4 * 2];

        // Precompute division and reduce operations
        float x = evenIndexVal / divide;
        float y = oddIndexVal / divide;

        // Store result directly
        result[id] = sqrtf(x * x + y * y);
    }
}