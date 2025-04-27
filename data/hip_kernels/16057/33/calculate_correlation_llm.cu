#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_correlation(float *norm, float *corelation, float *miu_x, float *miu_y, float *stdx, float *stdy, int *ikj, float *dif_variance, int max, float sum, int size) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    int tid = threadIdx.x;

    // Combined and simplified loops for miu_x and stdx computation
    for (int i = 0; i < max; i++) {
        if (idx >= i * max && idx < (i + 1) * max) {
            miu_x[idx] = i * norm[idx];
            stdx[idx] = ((i - miu_x[0]) * (i - miu_x[0])) * norm[idx];
        }
    }

    // Combined and simplified loops for miu_y and stdy computation
    for (int i = 0, blok = 0; i < max; i++) {
        if (blok == i && idx < max) {
            miu_y[blok * max + idx] = i * norm[idx * max + i];
            stdy[blok * max + idx] = ((i - miu_y[0]) * (i - miu_y[0])) * norm[idx * max + i];
            blok++;
        }
    }

    // Initialization of ikj matrix
    if (idx == 0) {
        for (int i = 0; i < max; i++) {
            for (int j = 0; j < max; j++) {
                ikj[max * i + j] = i * j;
            }
        }
    }

    // Compute corelation
    if (idx < size) {
        corelation[idx] = (ikj[idx] * norm[idx]);
    }

    // Parallel reduction for corelation
    for (int stride = 1; stride < size; stride *= 2) {
        if ((tid % (2 * stride)) == 0) {
            corelation[idx] += corelation[idx + stride];
        }
        __syncthreads();
    }

    // Parallel reduction for miu and stdy, stdx
    for (int stride = 1; stride < size; stride *= 2) {
        if ((tid % (2 * stride)) == 0) {
            miu_x[idx] += miu_x[idx + stride];
            stdy[idx] += stdy[idx + stride];
            miu_y[idx] += miu_y[idx + stride];
            stdx[idx] += stdx[idx + stride];
        }
        __syncthreads();
    }

    // Compute dif_variance
    if (idx == 0) {
        for (int i = 0; i < max; i++) {
            for (int j = 0; j < max; j++) {
                int k = abs(i - j);
                dif_variance[k] = ((k - ((miu_x[0] + miu_y[0]) / 2)) * (k - ((miu_x[0] + miu_y[0]) / 2))) * norm[k];
                if (k == i) {
                    dif_variance[k] += dif_variance[i];
                }
            }
        }
    }

    // Parallel reduction for dif_variance
    for (int stride = 1; stride < size; stride *= 2) {
        if ((tid % (2 * stride)) == 0) {
            dif_variance[idx] += dif_variance[idx + stride];
        }
        __syncthreads();
    }

    // Print results
    if (idx == 0) {
        printf("correlation %f\n", abs(corelation[0] - miu_x[0] * miu_y[0]) / (stdx[0] * stdy[0]));
        printf("variance %f\n", stdx[0]);
        printf("difference variance %f\n", dif_variance[0]);
    }
}