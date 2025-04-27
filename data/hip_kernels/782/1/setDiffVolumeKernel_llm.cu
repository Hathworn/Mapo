#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setDiffVolumeKernel(float *d_fv, unsigned char *d_picture1, unsigned char *d_picture2, unsigned picWidth, unsigned picHeight) {
    __shared__ float p1_section[10 * 10 * 4];
    __shared__ float p2_section[10 * 10 * 4];
    
    // Calculate thread and block indices efficiently
    unsigned sx = threadIdx.x % 10;
    unsigned sy = threadIdx.x / 100;
    unsigned sz = (threadIdx.x % 100) / 10;

    unsigned gz = (picWidth + 9) / 10; // Simplify grid dimension calculation
    unsigned gy = (picHeight + 9) / 10;
    unsigned gx = (picWidth + 9) / 10;
    
    unsigned bz = blockIdx.x % gz;
    unsigned by = blockIdx.x / (gx * gz);
    unsigned bx = (blockIdx.x % (gx * gz)) / gz;

    unsigned vx = sx + 10 * bx;
    unsigned vy = sy + 10 * by;
    unsigned vz = sz + 10 * bz;

    // Load subpicture to shared memory with boundary checks
    if(sz == 0 && vx < picWidth && vy < picHeight) {
        for(unsigned i = 0; i < 4; i++) {
            p1_section[(sx + sy * 10) * 4 + i] = (float) d_picture1[(vx + vy * picWidth) * 4 + i];
        }
    }
    if(sx == 0 && vz < picWidth && vy < picHeight) {
        for(unsigned i = 0; i < 4; i++) {
            p2_section[(sz + sy * 10) * 4 + i] = (float) d_picture2[(vz + vy * picWidth) * 4 + i];
        }
    }
    __syncthreads();

    // Compute the difference only if within bounds
    if(vx < picWidth && vy < picHeight && vz < picWidth) {
        unsigned c1 = (sx + sy * 10) * 4;
        unsigned c2 = (sz + sy * 10) * 4;
        d_fv[vz + vx * picWidth + vy * picWidth * picWidth] =
            sqrtf(
                powf(p1_section[c1 + 0] - p2_section[c2 + 0], 2.f) +
                powf(p1_section[c1 + 1] - p2_section[c2 + 1], 2.f) +
                powf(p1_section[c1 + 2] - p2_section[c2 + 2], 2.f) +
                powf(p1_section[c1 + 3] - p2_section[c2 + 3], 2.f)
            );
    }
}