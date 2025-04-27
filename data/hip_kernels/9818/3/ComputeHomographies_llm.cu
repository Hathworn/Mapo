#include "hip/hip_runtime.h"
#include "includes.h"

//================= Device matching functions =====================//

template <int size>
__device__ void InvertMatrix(float elem[size][size], float res[size][size])
{
    int indx[size];
    float b[size];
    float vv[size];
    for (int i = 0; i < size; i++)
        indx[i] = 0;
    int imax = 0;
    float d = 1.0;
    for (int i = 0; i < size; i++) { // find biggest element for each row
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
        for (int i = 0; i < j; i++) { // i<j
            float sum = elem[i][j]; // i<j (lower left)
            for (int k = 0; k < i; k++) // k<i<j
                sum -= elem[i][k] * elem[k][j]; // i>k (upper right), k<j (lower left)
            elem[i][j] = sum; // i<j (lower left)
        }
        float big = 0.0;
        for (int i = j; i < size; i++) { // i>=j
            float sum = elem[i][j]; // i>=j (upper right)
            for (int k = 0; k < j; k++) // k<j<=i
                sum -= elem[i][k] * elem[k][j]; // i>k (upper right), k<j (lower left)
            elem[i][j] = sum; // i>=j (upper right)
            float dum = vv[i] * fabs(sum);
            if (dum >= big) {
                big = dum;
                imax = i;
            }
        }
        if (j != imax) { // imax>j
            for (int k = 0; k < size; k++) {
                float dum = elem[imax][k]; // upper right and lower left
                elem[imax][k] = elem[j][k];
                elem[j][k] = dum;
            }
            d = -d;
            vv[imax] = vv[j];
        }
        indx[j] = imax;
        if (elem[j][j] == 0.0) // j==j (upper right)
            elem[j][j] = 1e-16;
        if (j != (size - 1)) {
            float dum = 1.0 / elem[j][j];
            for (int i = j + 1; i < size; i++) // i>j
                elem[i][j] *= dum; // i>j (upper right)
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
            if (ii != -1)
                for (int j = ii; j < i; j++)
                    sum -= elem[i][j] * b[j]; // i>j (upper right)
            else if (sum != 0.0)
                ii = i;
            b[i] = sum;
        }
        for (int i = size - 1; i >= 0; i--) {
            float sum = b[i];
            for (int j = i + 1; j < size; j++)
                sum -= elem[i][j] * b[j]; // i<j (lower left)
            b[i] = sum / elem[i][i]; // i==i (upper right)
        }
        for (int i = 0; i < size; i++)
            res[i][j] = b[i];
    }
}

__global__ void ComputeHomographies(float* coord, int* randPts, float* homo, int numPts)
{
    float a[8][8], ia[8][8];
    float b[8];
    const int idx = blockDim.x * blockIdx.x + threadIdx.x;
    const int numLoops = blockDim.x * gridDim.x;

    // Avoid branch divergence by using the same loop across threads
    for (int i = 0; i < 4; i++) {
        int pt = randPts[i * numLoops + idx];
        float x1 = coord[pt];
        float y1 = coord[pt + numPts];
        float x2 = coord[pt + 2 * numPts];
        float y2 = coord[pt + 3 * numPts];

        // Precompute repeated values to reduce redundant calculations
        float neg_x2_x1 = -x2 * x1;
        float neg_x2_y1 = -x2 * y1;
        float neg_y2_x1 = -y2 * x1;
        float neg_y2_y1 = -y2 * y1;

        // Populate matrices
        a[2 * i][0] = x1; a[2 * i][1] = y1; a[2 * i][2] = 1.0f;
        a[2 * i][3] = a[2 * i][4] = a[2 * i][5] = 0.0f;
        a[2 * i][6] = neg_x2_x1; a[2 * i][7] = neg_x2_y1;
        
        a[2 * i + 1][0] = a[2 * i + 1][1] = a[2 * i + 1][2] = 0.0f;
        a[2 * i + 1][3] = x1; a[2 * i + 1][4] = y1; a[2 * i + 1][5] = 1.0f;
        a[2 * i + 1][6] = neg_y2_x1; a[2 * i + 1][7] = neg_y2_y1;

        // Vector b with destination coordinates
        b[2 * i] = x2;
        b[2 * i + 1] = y2;
    }
    
    // Perform matrix inversion
    InvertMatrix<8>(a, ia);
    __syncthreads(); // Ensure all threads reach this point before proceeding

    // Compute homography matrix
    for (int j = 0; j < 8; j++) {
        float sum = 0.0f;
        for (int i = 0; i < 8; i++)
            sum += ia[j][i] * b[i];
        homo[j * numLoops + idx] = sum;
    }
    __syncthreads(); // Ensure all threads have finished computation
}