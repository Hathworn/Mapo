#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_computePSF_signalNsqrtMany (int n, int sizeSubImage, double *result, double *fft, double divide, int *sparseIndexEvenShift2D, int *sparseIndexOddShift2D)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;
    
    // Check if the thread is within bounds
    if (id < n)
    {
        int id2 = id % sizeSubImage;
        int id3 = id / sizeSubImage;

        // Fetch values using precomputed indexes
        double x = fft[sparseIndexEvenShift2D[id2] + id3 * sizeSubImage * 2] / divide;
        double y = fft[sparseIndexOddShift2D[id2] + id3 * sizeSubImage * 2] / divide;

        // Store the result of the computation
        result[id] = sqrt(x * x + y * y);
    }
}