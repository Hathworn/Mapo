#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histo_equalization_kernel ( unsigned char *buffer, long size, int *histo, unsigned char *output ) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;

    // Loop unrolling for improved performance
    while (i < size) {
        unsigned char pixel_value = buffer[i];
        unsigned char result = (unsigned char)(dev_lut[pixel_value] > 255 ? 255 : dev_lut[pixel_value]);
        output[i] = result;

        if (i + offset < size) {
            pixel_value = buffer[i + offset];
            result = (unsigned char)(dev_lut[pixel_value] > 255 ? 255 : dev_lut[pixel_value]);
            output[i + offset] = result;
        }

        i += 2 * offset;
    }
}