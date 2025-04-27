#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pool(unsigned char* image, unsigned char* new_image, unsigned height, unsigned width, int thread_count) {
    // Process image with shared memory optimization
    extern __shared__ unsigned char sharedImage[];

    int offset = (blockIdx.x * blockDim.x + threadIdx.x) * 4;
    int stride = thread_count * 4;

    // Load a tile of the image into shared memory
    for (int i = offset; i < min(offset + stride, width * height * 4); i += stride) {
        sharedImage[threadIdx.x + (i - offset)] = image[i];
    }
    __syncthreads();

    for (int i = offset; i < (width * height); i += stride) {
        int x = i % (width * 2) * 2;
        int y = i / (width * 2);
        int p1 = 8 * width * y + x;
        int p2 = 8 * width * y + x + 4;
        int p3 = 8 * width * y + x + 4 * width;
        int p4 = 8 * width * y + x + 4 * width + 4;

        unsigned r[] = { sharedImage[p1], sharedImage[p2], sharedImage[p3], sharedImage[p4] };
        unsigned g[] = { sharedImage[p1+1], sharedImage[p2+1], sharedImage[p3+1], sharedImage[p4+1] };
        unsigned b[] = { sharedImage[p1+2], sharedImage[p2+2], sharedImage[p3+2], sharedImage[p4+2] };
        unsigned a[] = { sharedImage[p1+3], sharedImage[p2+3], sharedImage[p3+3], sharedImage[p4+3] };

        unsigned rMax = max(max(r[0], r[1]), max(r[2], r[3]));
        unsigned gMax = max(max(g[0], g[1]), max(g[2], g[3]));
        unsigned bMax = max(max(b[0], b[1]), max(b[2], b[3]));
        unsigned aMax = max(max(a[0], a[1]), max(a[2], a[3]));

        new_image[i] = rMax;
        new_image[i+1] = gMax;
        new_image[i+2] = bMax;
        new_image[i+3] = aMax;
    }
}