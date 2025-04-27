#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitonicSort2(int *inputArray, const unsigned int stage, const unsigned int passOfStage, const unsigned int width) {
    int4 *theArray = (int4 *)inputArray;
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    int4 srcLeft, srcRight, mask;
    int4 imask10 = make_int4(0, 0, -1, -1);
    int4 imask11 = make_int4(0, -1, 0, -1);

    const unsigned int dir = 0;
    if (stage > 0) {
        if (passOfStage > 0) { // Upper level pass, exchange between two fours
            size_t r = 1 << (passOfStage - 1);
            size_t lmask = r - 1;
            size_t left = ((i >> (passOfStage - 1)) << passOfStage) + (i & lmask);
            size_t right = left + r;

            srcLeft = theArray[left];
            srcRight = theArray[right];

            mask.x = srcLeft.x < srcRight.x;
            mask.y = srcLeft.y < srcRight.y;
            mask.z = srcLeft.z < srcRight.z;
            mask.w = srcLeft.w < srcRight.w;

            int4 imin, imax;
            imin.x = (srcLeft.x & mask.x) | (srcRight.x & ~mask.x);
            imin.y = (srcLeft.y & mask.y) | (srcRight.y & ~mask.y);
            imin.z = (srcLeft.z & mask.z) | (srcRight.z & ~mask.z);
            imin.w = (srcLeft.w & mask.w) | (srcRight.w & ~mask.w);

            imax.x = (srcLeft.x & ~mask.x) | (srcRight.x & mask.x);
            imax.y = (srcLeft.y & ~mask.y) | (srcRight.y & mask.y);
            imax.z = (srcLeft.z & ~mask.z) | (srcRight.z & mask.z);
            imax.w = (srcLeft.w & ~mask.w) | (srcRight.w & mask.w);

            if (((i >> (stage - 1)) & 1) ^ dir) {
                theArray[left] = imin;
                theArray[right] = imax;
            } else {
                theArray[right] = imin;
                theArray[left] = imax;
            }
        } else { // Last pass, sort inside one four
            srcLeft = theArray[i];
            srcRight = make_int4(srcLeft.z, srcLeft.w, srcLeft.x, srcLeft.y);

            mask.x = (srcLeft.x < srcRight.x) ^ imask10.x;
            mask.y = (srcLeft.y < srcRight.y) ^ imask10.y;
            mask.z = (srcLeft.z < srcRight.z) ^ imask10.z;
            mask.w = (srcLeft.w < srcRight.w) ^ imask10.w;

            bool condition = ((i >> stage) & 1) ^ dir;
            int4 tempLeft, tempRight;
            
            tempLeft.x = (srcLeft.x & (condition ? mask.x : ~mask.x)) | (srcRight.x & (condition ? ~mask.x : mask.x));
            tempLeft.y = (srcLeft.y & (condition ? mask.y : ~mask.y)) | (srcRight.y & (condition ? ~mask.y : mask.y));
            tempLeft.z = (srcLeft.z & (condition ? mask.z : ~mask.z)) | (srcRight.z & (condition ? ~mask.z : mask.z));
            tempLeft.w = (srcLeft.w & (condition ? mask.w : ~mask.w)) | (srcRight.w & (condition ? ~mask.w : mask.w));

            srcRight = make_int4(tempLeft.y, tempLeft.x, tempLeft.w, tempLeft.z);
            mask.x = (tempLeft.x < srcRight.x) ^ imask11.x;
            mask.y = (tempLeft.y < srcRight.y) ^ imask11.y;
            mask.z = (tempLeft.z < srcRight.z) ^ imask11.z;
            mask.w = (tempLeft.w < srcRight.w) ^ imask11.w;

            theArray[i].x = (tempLeft.x & (condition ? mask.x : ~mask.x)) | (srcRight.x & (condition ? ~mask.x : mask.x));
            theArray[i].y = (tempLeft.y & (condition ? mask.y : ~mask.y)) | (srcRight.y & (condition ? ~mask.y : mask.y));
            theArray[i].z = (tempLeft.z & (condition ? mask.z : ~mask.z)) | (srcRight.z & (condition ? ~mask.z : mask.z));
            theArray[i].w = (tempLeft.w & (condition ? mask.w : ~mask.w)) | (srcRight.w & (condition ? ~mask.w : mask.w));
        }
    } else { // First stage, sort inside one four
        int4 imask0 = make_int4(0, -1, -1, 0);
        srcLeft = theArray[i];
        srcRight = make_int4(srcLeft.y, srcLeft.x, srcLeft.w, srcLeft.z);

        mask.x = (srcLeft.x < srcRight.x) ^ imask0.x;
        mask.y = (srcLeft.y < srcRight.y) ^ imask0.y;
        mask.z = (srcLeft.z < srcRight.z) ^ imask0.z;
        mask.w = (srcLeft.w < srcRight.w) ^ imask0.w;

        bool direction = (i & 1) ^ dir;
        int4 tempLeft;
        
        tempLeft.x = (srcLeft.x & (dir ? mask.x : ~mask.x)) | (srcRight.x & (dir ? ~mask.x : mask.x));
        tempLeft.y = (srcLeft.y & (dir ? mask.y : ~mask.y)) | (srcRight.y & (dir ? ~mask.y : mask.y));
        tempLeft.z = (srcLeft.z & (dir ? mask.z : ~mask.z)) | (srcRight.z & (dir ? ~mask.z : mask.z));
        tempLeft.w = (srcLeft.w & (dir ? mask.w : ~mask.w)) | (srcRight.w & (dir ? ~mask.w : mask.w));

        srcRight = make_int4(tempLeft.z, tempLeft.w, tempLeft.x, tempLeft.y);
        mask.x = (tempLeft.x < srcRight.x) ^ imask10.x;
        mask.y = (tempLeft.y < srcRight.y) ^ imask10.y;
        mask.z = (tempLeft.z < srcRight.z) ^ imask10.z;
        mask.w = (tempLeft.w < srcRight.w) ^ imask10.w;

        tempLeft.x = (tempLeft.x & (direction ? mask.x : ~mask.x)) | (srcRight.x & (direction ? ~mask.x : mask.x));
        tempLeft.y = (tempLeft.y & (direction ? mask.y : ~mask.y)) | (srcRight.y & (direction ? ~mask.y : mask.y));
        tempLeft.z = (tempLeft.z & (direction ? mask.z : ~mask.z)) | (srcRight.z & (direction ? ~mask.z : mask.z));
        tempLeft.w = (tempLeft.w & (direction ? mask.w : ~mask.w)) | (srcRight.w & (direction ? ~mask.w : mask.w));

        srcRight = make_int4(tempLeft.y, tempLeft.x, tempLeft.w, tempLeft.z);
        mask.x = (tempLeft.x < srcRight.x) ^ imask11.x;
        mask.y = (tempLeft.y < srcRight.y) ^ imask11.y;
        mask.z = (tempLeft.z < srcRight.z) ^ imask11.z;
        mask.w = (tempLeft.w < srcRight.w) ^ imask11.w;

        theArray[i].x = (tempLeft.x & (direction ? mask.x : ~mask.x)) | (srcRight.x & (direction ? ~mask.x : mask.x));
        theArray[i].y = (tempLeft.y & (direction ? mask.y : ~mask.y)) | (srcRight.y & (direction ? ~mask.y : mask.y));
        theArray[i].z = (tempLeft.z & (direction ? mask.z : ~mask.z)) | (srcRight.z & (direction ? ~mask.z : mask.z));
        theArray[i].w = (tempLeft.w & (direction ? mask.w : ~mask.w)) | (srcRight.w & (direction ? ~mask.w : mask.w));
    }
}