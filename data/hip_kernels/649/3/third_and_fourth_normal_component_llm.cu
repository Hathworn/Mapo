#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void third_and_fourth_normal_component(float* z, float* xx, float* yy, float* zx, float* zy, int npix, float* N3) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if the thread index is within the range
    if (i < npix) {
        // Compute and store the third normal component
        float temp_zx = xx[i] * zx[i];
        float temp_zy = yy[i] * zy[i];
        N3[i] = -z[i] - temp_zx - temp_zy;
        
        // Set the fourth normal component to 1
        N3[npix + i] = 1;
    }
}