#include "hip/hip_runtime.h"
#include "includes.h"
/* Copyright 2015 The TensorFlow Authors. All Rights Reserved.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/
#define EIGEN_USE_GPU

#ifdef HIGH_PREC
typedef double  VALUETYPE;
#else
typedef float   VALUETYPE;
#endif

typedef unsigned long long int_64;

__global__ void format_nlist_fill_b_se_a(int * nlist, const int nlist_size, const int nloc, const int * jrange, const int * jlist, int_64 * key, const int * sec_a, const int sec_a_size, int * nei_iter_dev, const int MAGIC_NUMBER)
{

    const unsigned int idy = blockIdx.x * blockDim.x + threadIdx.x;
    if(idy >= nloc) return; // Early exit if out of bounds

    int * row_nlist = nlist + idy * nlist_size;
    int * nei_iter = nei_iter_dev + idy * sec_a_size;
    int_64 * key_out = key + nloc * MAGIC_NUMBER + idy * MAGIC_NUMBER;

    // Initialize nei_iter for each section
    for (int ii = 0; ii < sec_a_size; ii++) {
        nei_iter[ii] = sec_a[ii];
    }

    // Process keys until the end marker is reached
    for (unsigned int kk = 0; key_out[kk] != key_out[MAGIC_NUMBER - 1]; kk++) {
        const int nei_type = key_out[kk] / 1E15; // Compute neighbor type
        // Safely increment iterator if limit not reached
        if (nei_iter[nei_type] < sec_a[nei_type + 1]) {
            row_nlist[nei_iter[nei_type]++] = key_out[kk] % 100000; // Store neighbor index
        }
    }
}