#include "hip/hip_runtime.h"
#include "includes.h"

/******************************************************************************
* Mathias Bourgoin, Université Pierre et Marie Curie (2011)
*
* Mathias.Bourgoin@gmail.com
*
* This software is a computer program whose purpose is to allow
* GPU programming with the OCaml language.
*
* This software is governed by the CeCILL-B license under French law and
* abiding by the rules of distribution of free software. You can  use,
* modify and/ or redistribute the software under the terms of the CeCILL-B
* license as circulated by CEA, CNRS and INRIA at the following URL
* "http://www.cecill.info".
*
* As a counterpart to the access to the source code and rights to copy,
* modify and redistribute granted by the license, users are provided only
* with a limited warranty  and the software's author,  the holder of the
* economic rights,  and the successive licensors  have only  limited
* liability.
*
* In this respect, the user's attention is drawn to the risks associated
* with loading, using, modifying and/or developing or reproducing the
* software by the user in light of its specific status of free software,
* that may mean  that it is complicated to manipulate,  and  that  also
* therefore means  that it is reserved for developers  and experienced
* professionals having in-depth computer knowledge. Users are therefore
* encouraged to load and test the software's suitability as regards their
* requirements in conditions enabling the security of their systems and/or
* data to be ensured and, more generally, to use and operate it in the
* same conditions as regards security.
*
* The fact that you are presently reading this means that you have had
* knowledge of the CeCILL-B license and that you accept its terms.
*******************************************************************************/
#ifdef __cplusplus
extern "C" {
#endif

/****** Single precision *****/





/****** Double precision *****/







#ifdef __cplusplus
}
#endif

__global__ void spoc_max(const double* input, double* output, const int size)
{
    // Use shared memory for reduction
    extern __shared__ double sdata[];
    int tid = threadIdx.x;
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Each thread loads one element into shared memory
    double myMax = (i < size) ? fabs(input[i]) : 0;
    sdata[tid] = myMax;
    __syncthreads();

    // Perform reduction in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] = max(sdata[tid], sdata[tid + s]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0)
    {
        atomicMax(output, sdata[0]);
    }
}