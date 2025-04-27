#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void implantCoeffs(float* matrices, float *coeffArray, int savedCoeffs, int dimsize) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize thread ID calculation to 1D

    int offsetMatrix = id * dimsize * dimsize;
    int offsetCoeff = id * savedCoeffs;
    int coeffsLeft = savedCoeffs;
    int x = 0, y = 0, y_n = 0, x_n = 1;
    int numberinrow, tmp;

    matrices[offsetMatrix] = coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)];
    coeffsLeft--;

    while (coeffsLeft > 0) {
        x = x_n;
        y = y_n;
        numberinrow = (x_n < dimsize - 1) ? (x_n + 1) : (x_n - (y_n - 1));

        while (numberinrow > 0 && coeffsLeft > 0) {
            matrices[offsetMatrix + x + y * dimsize] = coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)];
            numberinrow--;
            coeffsLeft--;

            if (numberinrow % 2 == 0) {
                tmp = x;
                x = y;
                y = tmp;
                x--;
                y++;
            } else {
                tmp = x;
                x = y;
                y = tmp;
            }
        }
        if (coeffsLeft > 0 && numberinrow == 1) {
            matrices[offsetMatrix + x + y * dimsize] = coeffArray[offsetCoeff + (savedCoeffs - coeffsLeft)];
            coeffsLeft--;
        }

        if (x_n == dimsize - 1) {
            y_n++;
        } else {
            x_n++;
        }
    }
}