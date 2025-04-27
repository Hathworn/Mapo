#include "hip/hip_runtime.h"
#include "includes.h"

#define FMC2W 16
#define FMC2H 4

#define M7W   32
#define M7H   32
#define M7R    4
#define NRX    2
#define NDIM 128

#define FMC_GH  512
#define FMC_BW   32
#define FMC_BH   32
#define FMC_BD   16
#define FMC_TW    1
#define FMC_TH    4
#define FMC_NW   (FMC_BW/FMC_TW)
#define FMC_NH   (FMC_BH/FMC_TH)
#define FMC_NT   (FMC_NW*FMC_NH)

__device__ volatile int lock = 0;

template <int size>
__device__ void InvertMatrix(float elem[size][size], float res[size][size]) {
    int indx[size];
    float b[size];
    float vv[size];
    for (int i = 0; i < size; i++)
        indx[i] = 0;

    int imax = 0;
    float d = 1.0;
    
    for (int i = 0; i < size; i++) {
        float big = 0.0;
        for (int j = 0; j < size; j++) {
            float temp = fabs(elem[i][j]);
            if (temp > big)
                big = temp;
        }
        if (big > 0.0)
            vv[i] = 1.0 / big;
        else
            vv[i] = 1e16;
    }

    for (int j = 0; j < size; j++) {
        for (int i = 0; i < j; i++) {
            float sum = elem[i][j];
            for (int k = 0; k < i; k++)
                sum -= elem[i][k] * elem[k][j];
            elem[i][j] = sum;
        }
        float big = 0.0;
        for (int i = j; i < size; i++) {
            float sum = elem[i][j];
            for (int k = 0; k < j; k++)
                sum -= elem[i][k] * elem[k][j];
            elem[i][j] = sum;
            float dum = vv[i] * fabs(sum);
            if (dum >= big) {
                big = dum;
                imax = i;
            }
        }
        if (j != imax) {
            for (int k = 0; k < size; k++) {
                float dum = elem[imax][k];
                elem[imax][k] = elem[j][k];
                elem[j][k] = dum;
            }
            d = -d;
            vv[imax] = vv[j];
        }
        indx[j] = imax;
        if (elem[j][j] == 0.0)
            elem[j][j] = 1e-16;
        if (j != (size - 1)) {
            float dum = 1.0 / elem[j][j];
            for (int i = j + 1; i < size; i++)
                elem[i][j] *= dum;
        }
    }

    for (int j = 0; j < size; j++) {
        for (int k = 0; k < size; k++)
            b[k] = 0.0;
        b[j] = 1.0;
        int ii = -1;
        for (int i = 0; i < size; i++) {
            int ip = indx[i];
            float sum = b[ip];
            b[ip] = b[i];
            if (ii != -1) {
                for (int j = ii; j < i; j++)
                    sum -= elem[i][j] * b[j];
            } else if (sum != 0.0) {
                ii = i;
            }
            b[i] = sum;
        }
        for (int i = size - 1; i >= 0; i--) {
            float sum = b[i];
            for (int j = i + 1; j < size; j++)
                sum -= elem[i][j] * b[j];
            b[i] = sum / elem[i][i];
        }
        for (int i = 0; i < size; i++)
            res[i][j] = b[i];
    }
}

__global__ void ComputeHomographies(float *coord, int *randPts, float *homo, int numPts) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int numLoops = blockDim.x * gridDim.x;

    float a[8][8] = {0}, ia[8][8], b[8] = {0};

    // Loop unrolling and prefetching points
    #pragma unroll
    for (int i = 0; i < 4; i++) {
        int pt = randPts[i * numLoops + idx];
        float x1 = coord[pt];
        float y1 = coord[pt + numPts];
        float x2 = coord[pt + 2 * numPts];
        float y2 = coord[pt + 3 * numPts];
        
        // Setup matrix 'a' and vector 'b'
        float *row1 = a[2 * i];
        row1[0] = x1; row1[1] = y1; row1[2] = 1.0;
        row1[6] = -x2 * x1; row1[7] = -x2 * y1;
        float *row2 = a[2 * i + 1];
        row2[3] = x1; row2[4] = y1; row2[5] = 1.0;
        row2[6] = -y2 * x1; row2[7] = -y2 * y1;
        
        b[2 * i] = x2; b[2 * i + 1] = y2;
    }
    
    InvertMatrix<8>(a, ia);

    // Compute homography
    #pragma unroll
    for (int j = 0; j < 8; j++) {
        float sum = 0.0f;
        #pragma unroll
        for (int i = 0; i < 8; i++)
            sum += ia[j][i] * b[i];
        homo[j * numLoops + idx] = sum;
    }
}
```
