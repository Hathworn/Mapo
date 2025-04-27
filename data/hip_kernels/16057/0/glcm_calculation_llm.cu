#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void glcm_calculation(int *A, int *glcm, float *glcmNorm, const int nx, const int ny, int maxx)
{
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    // Calculate GLCM
    if (idx < nx * ny) {
        int k, l;
        for (k = 0; k <= maxx; k++) {
            for (l = 0; l <= maxx; l++) {
                if (A[idx] == k && A[idx + 1] == l) {
                    int p = (maxx + 1) * k + l;
                    atomicAdd(&glcm[p], 1); // Use atomicAdd to prevent race conditions
                }
            }
        }
    }

    // Normalization
    if (idx < (maxx + 1) * (maxx + 1)) {
        int sum = 0;
        __shared__ int shared_sum; // Use shared memory to accelerate sum calculation

        if (threadIdx.x == 0 && threadIdx.y == 0) {
            for (int k = 0; k < (maxx + 1) * (maxx + 1); k++) {
                sum += glcm[k];
            }
            shared_sum = sum;
        }
        __syncthreads();

        glcmNorm[idx] = float(glcm[idx]) / float(shared_sum);
    }

    // Additional Calculations
    if (ix < 1) {
        float sums = 0;
        float f1 = 0;
        float f2 = 0;
        float f4 = 0;

        for (int k = 0; k < (maxx + 1) * (maxx + 1); k++) {
            sums += glcmNorm[k];
            f1 += glcmNorm[k];
            f2 += k * k * sums;
            if (glcmNorm[k] > 0) f4 += glcmNorm[k] * log10f(glcmNorm[k]);
        }

        float f3 = sqrt(f1);

        printf("ASM : %.1f\n", f1);
        printf("Contrast : %.1f\n", f2);
        printf("Energy : %.1f\n", f3);
        printf("Entropy : %.1f\n", f4);
    }
}