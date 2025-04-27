#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_IMC(float *norm, float *IMC, float *HX, float *HY, float *entropy, float *px, float *py, float *HXY, int max, float sum, int size) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    int tid = threadIdx.x;

    if (idx < size) {
        float norm_value = norm[idx];
        if (norm_value > 0) {
            float log_value = log10f(norm_value);
            entropy[idx] = -norm_value * log_value;

            int row = idx / max;
            HX[idx] = -norm_value * log_value;

            atomicAdd(&px[row], norm_value);
            atomicAdd(&py[ix], norm_value);

            __syncthreads();

            if (tid == 0) {
                for (int i = 1; i < max; ++i) {
                    hx_val += HX[row * max + i];
                    hy_val += HY[i * max + ix];
                }
                HX[idx] = hx_val;
                HY[idx] = hy_val;
            }
        }
    }

    __syncthreads();

    if (idx > 9000 && norm[idx] > 0) {
        HXY[idx] = fabsf(norm[idx] * log10f(px[0] * py[0]));
    }
    
    for (int stride = 1; stride < size; stride *= 2) {
        if ((tid % (2 * stride)) == 0 && (idx + stride) < size) {
            HXY[idx] += HXY[idx + stride];
        }
        __syncthreads();
    }

    if (idx == 0) {
        if (HX[0] > HY[0]) {
            IMC[0] = (entropy[0] - HXY[0]) / HX[0];
        } else {
            IMC[0] = (entropy[0] - HXY[0]) / HY[0];
        }
        printf("IMC %f\n", fabsf(IMC[0]));
    }
}