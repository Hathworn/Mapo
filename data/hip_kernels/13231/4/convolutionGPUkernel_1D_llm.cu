#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionGPUkernel_1D(int *h_n, int *h_mascara, int *h_r, int n, int mascara) {
    int mitadMascara = (mascara / 2);
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n) {
        int p = 0;
        int k = i - mitadMascara;

        #pragma unroll // Unroll the loop for better performance
        for (int j = 0; j < mascara; j++) {
            if (k < n && k >= 0) {
                p += h_n[k] * h_mascara[j];
            }
            k++;
        }

        h_r[i] = p; // Store result
    }
}