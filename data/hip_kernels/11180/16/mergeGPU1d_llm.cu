#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeGPU1d( unsigned char *image1, unsigned char *image2, unsigned char *res, int pixels ) {

    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Use built-in vectorized operations for better performance and readability
    if (i < pixels) {
        int idx = 3 * i;
        int4 pixel1 = make_int4(image1[idx], image1[idx + 1], image1[idx + 2], 0);
        int4 pixel2 = make_int4(image2[idx], image2[idx + 1], image2[idx + 2], 0);

        // Calculate the average directly using int operations
        int4 avg = make_int4((pixel1.z + pixel2.z) >> 1,
                             (pixel1.y + pixel2.y) >> 1,
                             (pixel1.x + pixel2.x) >> 1, 
                             0);

        res[idx] = static_cast<unsigned char>(avg.x);
        res[idx + 1] = static_cast<unsigned char>(avg.y);
        res[idx + 2] = static_cast<unsigned char>(avg.z);
    }
}