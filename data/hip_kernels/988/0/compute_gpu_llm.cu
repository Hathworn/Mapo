#include "hip/hip_runtime.h"
#include "includes.h"
#define K 3
#define BLCH 8
#define BLCW 32

__global__ void compute_gpu(float *img, float *f, float *out, int bh, int bw, int imgH, int imgW, int imgN, int nF, int convH, int convW){
    int idY = blockDim.y * blockIdx.y + threadIdx.y;
    int idX = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize indexing by precomputing offsets
    int imgSize = imgW * imgH;
    int convSize = convW * convH;
    int filterSize = nF * nF;

    for (int mi = 0; mi < imgN; mi++) {
        int inm1 = mi * imgSize; // Fixed offset for current image
        int ind1 = mi * convSize; // Fixed offset for output

        if (idX < convH && idY < convW) {
            int ind3 = ind1 + idX * convW + idY; // Output index within the current feature map
            int inm3 = inm1 + idX * imgW + idY; // Image index within the current image

            for (int fi = 0; fi < nF; fi++) {
                int inm4 = inm3 + imgW * fi; // Image index offset by filter row
                int inf = (ind3 * nF + fi) * nF; // Filter index within the current filter

                // Perform convolution
                float sum = 0.0f; // Use a local accumulator to optimize memory access
                for (int fj = 0; fj < nF; fj++) {
                    sum += img[inm4 + fj] * f[inf + fj];
                }
                // Write accumulated result to prevent multiple accesses to global memory
                out[ind3] += sum;
            }
        }
    }
}