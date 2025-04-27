```c
#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int f() { return 21; }

__device__ void calculateZ(int* result, int a0, int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10, int a11, int a12, int a13, int a14, int a15, int x, int modulus)
{
    // Optimized Horner's method for polynomial evaluation
    int res = a15;
    res = (res * x + a14) % modulus;
    res = (res * x + a13) % modulus;
    res = (res * x + a12) % modulus;
    res = (res * x + a11) % modulus;
    res = (res * x + a10) % modulus;
    res = (res * x + a9)  % modulus;
    res = (res * x + a8)  % modulus;
    res = (res * x + a7)  % modulus;
    res = (res * x + a6)  % modulus;
    res = (res * x + a5)  % modulus;
    res = (res * x + a4)  % modulus;
    res = (res * x + a3)  % modulus;
    res = (res * x + a2)  % modulus;
    res = (res * x + a1)  % modulus;
    res = (res * x + a0)  % modulus;
    *result = res;
}

__global__ void calcPoly16()
{
    int f_base = threadIdx.z; // is 0-4
    int a1  = threadIdx.y;
    int a2  = threadIdx.x;

    int a3  =  blockIdx.z       & 0xF;
    int a4  = (blockIdx.z >> 4) & 0xF;
    int a5  = (blockIdx.z >> 8) & 0xF;

    int a6  =  blockIdx.y       & 0xF;
    int a7  = (blockIdx.y >> 4) & 0xF;
    int a8  = (blockIdx.y >> 8) & 0xF;

    int a9  =   blockIdx.x        & 0xF;
    int a10 = (blockIdx.x >> 4)  & 0xF;
    int a11 = (blockIdx.x >> 8)  & 0xF;
    int a12 = (blockIdx.x >> 12) & 0xF;
    int a13 = (blockIdx.x >> 16) & 0xF;
    int a14 = (blockIdx.x >> 20) & 0xF;
    int a15 = (blockIdx.x >> 24) & 0xF;

    int MOD = 17; // Compiler seems automatically optimized % 16 to & 0xF

    int a0 = 4*f_base;

    int Y[10] = {0};  // Array for storing intermediate results

    for(int x = 0; x < 8; x++)
    {
        int result = 0;
        calculateZ(&result, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, x, MOD);
        Y[0] |= (1 << ((result + 0) % MOD));
        Y[1] |= (1 << ((result + 1) % MOD));
        Y[2] |= (1 << ((result + 2) % MOD));
        Y[3] |= (1 << ((result + 3) % MOD));
    }

    for (int idx_fg = 0; idx_fg < 4; idx_fg++)
    {
        if (Y[idx_fg] == 0b0011001101010011)
        {
            for(int x = 8; x < 16; x++)
            {
                int result = 0;
                calculateZ(&result, a0 + idx_fg, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, x, MOD);
                Y[4 + idx_fg] |= (1 << (result % MOD));
            }

            if (Y[4+idx_fg] == 0b1100110010101100)
            {
                int res[16];
                for(int tmpi = 0; tmpi < 16; tmpi++)
                {
                    calculateZ(&res[tmpi], a0 + idx_fg, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, tmpi, MOD);
                }

                printf("a=[%2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d, %2d,], res=[%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,%2d,] Y=[%d %d %d %d %d %d %d %d %d %d]\n",
                       a0 + idx_fg, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, 
                       res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7], res[8], res[9], res[10], res[11], res[12], res[13], res[14], res[15],
                       Y[0], Y[1], Y[2], Y[3], Y[4], Y[5], Y[6], Y[7], Y[8], Y[9]);
            }
        }
    }
}