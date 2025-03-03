; ModuleID = '../data/hip_kernels/14271/9/main.cu'
source_filename = "../data/hip_kernels/14271/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14seqPheroUpdatePfS_PiS_(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = bitcast float addrspace(1)* %0 to i8 addrspace(1)*
  %6 = bitcast float addrspace(1)* %1 to i8 addrspace(1)*
  br label %7

7:                                                ; preds = %7, %4
  %8 = phi i8 addrspace(1)* [ %6, %4 ], [ %154, %7 ]
  %9 = phi i8 addrspace(1)* [ %5, %4 ], [ %155, %7 ]
  %10 = phi i64 [ 3600, %4 ], [ %153, %7 ]
  %11 = load i8, i8 addrspace(1)* %8, align 1, !tbaa !4
  store i8 %11, i8 addrspace(1)* %9, align 1, !tbaa !4
  %12 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 1
  %13 = load i8, i8 addrspace(1)* %12, align 1, !tbaa !4
  %14 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 1
  store i8 %13, i8 addrspace(1)* %14, align 1, !tbaa !4
  %15 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 2
  %16 = load i8, i8 addrspace(1)* %15, align 1, !tbaa !4
  %17 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 2
  store i8 %16, i8 addrspace(1)* %17, align 1, !tbaa !4
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 3
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !4
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 3
  store i8 %19, i8 addrspace(1)* %20, align 1, !tbaa !4
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 4
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 4
  %23 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !4
  store i8 %23, i8 addrspace(1)* %22, align 1, !tbaa !4
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 5
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !4
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 5
  store i8 %25, i8 addrspace(1)* %26, align 1, !tbaa !4
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 6
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !4
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 6
  store i8 %28, i8 addrspace(1)* %29, align 1, !tbaa !4
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 7
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !4
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 7
  store i8 %31, i8 addrspace(1)* %32, align 1, !tbaa !4
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 8
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 8
  %35 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !4
  store i8 %35, i8 addrspace(1)* %34, align 1, !tbaa !4
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 9
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !4
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 9
  store i8 %37, i8 addrspace(1)* %38, align 1, !tbaa !4
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 10
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !4
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 10
  store i8 %40, i8 addrspace(1)* %41, align 1, !tbaa !4
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 11
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !4
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 11
  store i8 %43, i8 addrspace(1)* %44, align 1, !tbaa !4
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 12
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 12
  %47 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !4
  store i8 %47, i8 addrspace(1)* %46, align 1, !tbaa !4
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 13
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !4
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 13
  store i8 %49, i8 addrspace(1)* %50, align 1, !tbaa !4
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 14
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !4
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 14
  store i8 %52, i8 addrspace(1)* %53, align 1, !tbaa !4
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 15
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !4
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 15
  store i8 %55, i8 addrspace(1)* %56, align 1, !tbaa !4
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 16
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 16
  %59 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !4
  store i8 %59, i8 addrspace(1)* %58, align 1, !tbaa !4
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 17
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !4
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 17
  store i8 %61, i8 addrspace(1)* %62, align 1, !tbaa !4
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 18
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !4
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 18
  store i8 %64, i8 addrspace(1)* %65, align 1, !tbaa !4
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 19
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !4
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 19
  store i8 %67, i8 addrspace(1)* %68, align 1, !tbaa !4
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 20
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 20
  %71 = load i8, i8 addrspace(1)* %69, align 1, !tbaa !4
  store i8 %71, i8 addrspace(1)* %70, align 1, !tbaa !4
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 21
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !4
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 21
  store i8 %73, i8 addrspace(1)* %74, align 1, !tbaa !4
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 22
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !4
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 22
  store i8 %76, i8 addrspace(1)* %77, align 1, !tbaa !4
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 23
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !4
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 23
  store i8 %79, i8 addrspace(1)* %80, align 1, !tbaa !4
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 24
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 24
  %83 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !4
  store i8 %83, i8 addrspace(1)* %82, align 1, !tbaa !4
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 25
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !4
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 25
  store i8 %85, i8 addrspace(1)* %86, align 1, !tbaa !4
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 26
  %88 = load i8, i8 addrspace(1)* %87, align 1, !tbaa !4
  %89 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 26
  store i8 %88, i8 addrspace(1)* %89, align 1, !tbaa !4
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 27
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !4
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 27
  store i8 %91, i8 addrspace(1)* %92, align 1, !tbaa !4
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 28
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 28
  %95 = load i8, i8 addrspace(1)* %93, align 1, !tbaa !4
  store i8 %95, i8 addrspace(1)* %94, align 1, !tbaa !4
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 29
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !4
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 29
  store i8 %97, i8 addrspace(1)* %98, align 1, !tbaa !4
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 30
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !4
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 30
  store i8 %100, i8 addrspace(1)* %101, align 1, !tbaa !4
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 31
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !4
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 31
  store i8 %103, i8 addrspace(1)* %104, align 1, !tbaa !4
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 32
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 32
  %107 = load i8, i8 addrspace(1)* %105, align 1, !tbaa !4
  store i8 %107, i8 addrspace(1)* %106, align 1, !tbaa !4
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 33
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !4
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 33
  store i8 %109, i8 addrspace(1)* %110, align 1, !tbaa !4
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 34
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !4
  %113 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 34
  store i8 %112, i8 addrspace(1)* %113, align 1, !tbaa !4
  %114 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 35
  %115 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !4
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 35
  store i8 %115, i8 addrspace(1)* %116, align 1, !tbaa !4
  %117 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 36
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 36
  %119 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !4
  store i8 %119, i8 addrspace(1)* %118, align 1, !tbaa !4
  %120 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 37
  %121 = load i8, i8 addrspace(1)* %120, align 1, !tbaa !4
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 37
  store i8 %121, i8 addrspace(1)* %122, align 1, !tbaa !4
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 38
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !4
  %125 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 38
  store i8 %124, i8 addrspace(1)* %125, align 1, !tbaa !4
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 39
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !4
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 39
  store i8 %127, i8 addrspace(1)* %128, align 1, !tbaa !4
  %129 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 40
  %130 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 40
  %131 = load i8, i8 addrspace(1)* %129, align 1, !tbaa !4
  store i8 %131, i8 addrspace(1)* %130, align 1, !tbaa !4
  %132 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 41
  %133 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !4
  %134 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 41
  store i8 %133, i8 addrspace(1)* %134, align 1, !tbaa !4
  %135 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 42
  %136 = load i8, i8 addrspace(1)* %135, align 1, !tbaa !4
  %137 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 42
  store i8 %136, i8 addrspace(1)* %137, align 1, !tbaa !4
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 43
  %139 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !4
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 43
  store i8 %139, i8 addrspace(1)* %140, align 1, !tbaa !4
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 44
  %142 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 44
  %143 = load i8, i8 addrspace(1)* %141, align 1, !tbaa !4
  store i8 %143, i8 addrspace(1)* %142, align 1, !tbaa !4
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 45
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !4
  %146 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 45
  store i8 %145, i8 addrspace(1)* %146, align 1, !tbaa !4
  %147 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 46
  %148 = load i8, i8 addrspace(1)* %147, align 1, !tbaa !4
  %149 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 46
  store i8 %148, i8 addrspace(1)* %149, align 1, !tbaa !4
  %150 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 47
  %151 = load i8, i8 addrspace(1)* %150, align 1, !tbaa !4
  %152 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 47
  store i8 %151, i8 addrspace(1)* %152, align 1, !tbaa !4
  %153 = add nsw i64 %10, -48
  %154 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 48
  %155 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 48
  %156 = icmp eq i64 %153, 0
  br i1 %156, label %157, label %7, !llvm.loop !7

157:                                              ; preds = %7
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 30
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !9
  %160 = fmul contract float %159, 5.000000e-01
  %161 = fcmp contract olt float %160, 0.000000e+00
  %162 = select i1 %161, float 0x3FA1111120000000, float %160
  store float %162, float addrspace(1)* %158, align 4, !tbaa !9
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  store float %162, float addrspace(1)* %163, align 4, !tbaa !9
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 60
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !9
  %166 = fmul contract float %165, 5.000000e-01
  %167 = fcmp contract olt float %166, 0.000000e+00
  %168 = select i1 %167, float 0x3FA1111120000000, float %166
  store float %168, float addrspace(1)* %164, align 4, !tbaa !9
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  store float %168, float addrspace(1)* %169, align 4, !tbaa !9
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 61
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !9
  %172 = fmul contract float %171, 5.000000e-01
  %173 = fcmp contract olt float %172, 0.000000e+00
  %174 = select i1 %173, float 0x3FA1111120000000, float %172
  store float %174, float addrspace(1)* %170, align 4, !tbaa !9
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 32
  store float %174, float addrspace(1)* %175, align 4, !tbaa !9
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 90
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !9
  %178 = fmul contract float %177, 5.000000e-01
  %179 = fcmp contract olt float %178, 0.000000e+00
  %180 = select i1 %179, float 0x3FA1111120000000, float %178
  store float %180, float addrspace(1)* %176, align 4, !tbaa !9
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 3
  store float %180, float addrspace(1)* %181, align 4, !tbaa !9
  %182 = getelementptr inbounds float, float addrspace(1)* %0, i64 91
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !9
  %184 = fmul contract float %183, 5.000000e-01
  %185 = fcmp contract olt float %184, 0.000000e+00
  %186 = select i1 %185, float 0x3FA1111120000000, float %184
  store float %186, float addrspace(1)* %182, align 4, !tbaa !9
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 33
  store float %186, float addrspace(1)* %187, align 4, !tbaa !9
  %188 = getelementptr inbounds float, float addrspace(1)* %0, i64 92
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !9
  %190 = fmul contract float %189, 5.000000e-01
  %191 = fcmp contract olt float %190, 0.000000e+00
  %192 = select i1 %191, float 0x3FA1111120000000, float %190
  store float %192, float addrspace(1)* %188, align 4, !tbaa !9
  %193 = getelementptr inbounds float, float addrspace(1)* %0, i64 63
  store float %192, float addrspace(1)* %193, align 4, !tbaa !9
  %194 = getelementptr inbounds float, float addrspace(1)* %0, i64 120
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !9
  %196 = fmul contract float %195, 5.000000e-01
  %197 = fcmp contract olt float %196, 0.000000e+00
  %198 = select i1 %197, float 0x3FA1111120000000, float %196
  store float %198, float addrspace(1)* %194, align 4, !tbaa !9
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 4
  store float %198, float addrspace(1)* %199, align 4, !tbaa !9
  %200 = getelementptr inbounds float, float addrspace(1)* %0, i64 121
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !9
  %202 = fmul contract float %201, 5.000000e-01
  %203 = fcmp contract olt float %202, 0.000000e+00
  %204 = select i1 %203, float 0x3FA1111120000000, float %202
  store float %204, float addrspace(1)* %200, align 4, !tbaa !9
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 34
  store float %204, float addrspace(1)* %205, align 4, !tbaa !9
  %206 = getelementptr inbounds float, float addrspace(1)* %0, i64 122
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !9
  %208 = fmul contract float %207, 5.000000e-01
  %209 = fcmp contract olt float %208, 0.000000e+00
  %210 = select i1 %209, float 0x3FA1111120000000, float %208
  store float %210, float addrspace(1)* %206, align 4, !tbaa !9
  %211 = getelementptr inbounds float, float addrspace(1)* %0, i64 64
  store float %210, float addrspace(1)* %211, align 4, !tbaa !9
  %212 = getelementptr inbounds float, float addrspace(1)* %0, i64 123
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !9
  %214 = fmul contract float %213, 5.000000e-01
  %215 = fcmp contract olt float %214, 0.000000e+00
  %216 = select i1 %215, float 0x3FA1111120000000, float %214
  store float %216, float addrspace(1)* %212, align 4, !tbaa !9
  %217 = getelementptr inbounds float, float addrspace(1)* %0, i64 94
  store float %216, float addrspace(1)* %217, align 4, !tbaa !9
  %218 = getelementptr inbounds float, float addrspace(1)* %0, i64 150
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !9
  %220 = fmul contract float %219, 5.000000e-01
  %221 = fcmp contract olt float %220, 0.000000e+00
  %222 = select i1 %221, float 0x3FA1111120000000, float %220
  store float %222, float addrspace(1)* %218, align 4, !tbaa !9
  %223 = getelementptr inbounds float, float addrspace(1)* %0, i64 5
  store float %222, float addrspace(1)* %223, align 4, !tbaa !9
  %224 = getelementptr inbounds float, float addrspace(1)* %0, i64 151
  %225 = load float, float addrspace(1)* %224, align 4, !tbaa !9
  %226 = fmul contract float %225, 5.000000e-01
  %227 = fcmp contract olt float %226, 0.000000e+00
  %228 = select i1 %227, float 0x3FA1111120000000, float %226
  store float %228, float addrspace(1)* %224, align 4, !tbaa !9
  %229 = getelementptr inbounds float, float addrspace(1)* %0, i64 35
  store float %228, float addrspace(1)* %229, align 4, !tbaa !9
  %230 = getelementptr inbounds float, float addrspace(1)* %0, i64 152
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !9
  %232 = fmul contract float %231, 5.000000e-01
  %233 = fcmp contract olt float %232, 0.000000e+00
  %234 = select i1 %233, float 0x3FA1111120000000, float %232
  store float %234, float addrspace(1)* %230, align 4, !tbaa !9
  %235 = getelementptr inbounds float, float addrspace(1)* %0, i64 65
  store float %234, float addrspace(1)* %235, align 4, !tbaa !9
  %236 = getelementptr inbounds float, float addrspace(1)* %0, i64 153
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !9
  %238 = fmul contract float %237, 5.000000e-01
  %239 = fcmp contract olt float %238, 0.000000e+00
  %240 = select i1 %239, float 0x3FA1111120000000, float %238
  store float %240, float addrspace(1)* %236, align 4, !tbaa !9
  %241 = getelementptr inbounds float, float addrspace(1)* %0, i64 95
  store float %240, float addrspace(1)* %241, align 4, !tbaa !9
  %242 = getelementptr inbounds float, float addrspace(1)* %0, i64 154
  %243 = load float, float addrspace(1)* %242, align 4, !tbaa !9
  %244 = fmul contract float %243, 5.000000e-01
  %245 = fcmp contract olt float %244, 0.000000e+00
  %246 = select i1 %245, float 0x3FA1111120000000, float %244
  store float %246, float addrspace(1)* %242, align 4, !tbaa !9
  %247 = getelementptr inbounds float, float addrspace(1)* %0, i64 125
  store float %246, float addrspace(1)* %247, align 4, !tbaa !9
  %248 = getelementptr inbounds float, float addrspace(1)* %0, i64 180
  %249 = load float, float addrspace(1)* %248, align 4, !tbaa !9
  %250 = fmul contract float %249, 5.000000e-01
  %251 = fcmp contract olt float %250, 0.000000e+00
  %252 = select i1 %251, float 0x3FA1111120000000, float %250
  store float %252, float addrspace(1)* %248, align 4, !tbaa !9
  %253 = getelementptr inbounds float, float addrspace(1)* %0, i64 6
  store float %252, float addrspace(1)* %253, align 4, !tbaa !9
  %254 = getelementptr inbounds float, float addrspace(1)* %0, i64 181
  %255 = load float, float addrspace(1)* %254, align 4, !tbaa !9
  %256 = fmul contract float %255, 5.000000e-01
  %257 = fcmp contract olt float %256, 0.000000e+00
  %258 = select i1 %257, float 0x3FA1111120000000, float %256
  store float %258, float addrspace(1)* %254, align 4, !tbaa !9
  %259 = getelementptr inbounds float, float addrspace(1)* %0, i64 36
  store float %258, float addrspace(1)* %259, align 4, !tbaa !9
  %260 = getelementptr inbounds float, float addrspace(1)* %0, i64 182
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !9
  %262 = fmul contract float %261, 5.000000e-01
  %263 = fcmp contract olt float %262, 0.000000e+00
  %264 = select i1 %263, float 0x3FA1111120000000, float %262
  store float %264, float addrspace(1)* %260, align 4, !tbaa !9
  %265 = getelementptr inbounds float, float addrspace(1)* %0, i64 66
  store float %264, float addrspace(1)* %265, align 4, !tbaa !9
  %266 = getelementptr inbounds float, float addrspace(1)* %0, i64 183
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !9
  %268 = fmul contract float %267, 5.000000e-01
  %269 = fcmp contract olt float %268, 0.000000e+00
  %270 = select i1 %269, float 0x3FA1111120000000, float %268
  store float %270, float addrspace(1)* %266, align 4, !tbaa !9
  %271 = getelementptr inbounds float, float addrspace(1)* %0, i64 96
  store float %270, float addrspace(1)* %271, align 4, !tbaa !9
  %272 = getelementptr inbounds float, float addrspace(1)* %0, i64 184
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !9
  %274 = fmul contract float %273, 5.000000e-01
  %275 = fcmp contract olt float %274, 0.000000e+00
  %276 = select i1 %275, float 0x3FA1111120000000, float %274
  store float %276, float addrspace(1)* %272, align 4, !tbaa !9
  %277 = getelementptr inbounds float, float addrspace(1)* %0, i64 126
  store float %276, float addrspace(1)* %277, align 4, !tbaa !9
  %278 = getelementptr inbounds float, float addrspace(1)* %0, i64 185
  %279 = load float, float addrspace(1)* %278, align 4, !tbaa !9
  %280 = fmul contract float %279, 5.000000e-01
  %281 = fcmp contract olt float %280, 0.000000e+00
  %282 = select i1 %281, float 0x3FA1111120000000, float %280
  store float %282, float addrspace(1)* %278, align 4, !tbaa !9
  %283 = getelementptr inbounds float, float addrspace(1)* %0, i64 156
  store float %282, float addrspace(1)* %283, align 4, !tbaa !9
  %284 = getelementptr inbounds float, float addrspace(1)* %0, i64 210
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !9
  %286 = fmul contract float %285, 5.000000e-01
  %287 = fcmp contract olt float %286, 0.000000e+00
  %288 = select i1 %287, float 0x3FA1111120000000, float %286
  store float %288, float addrspace(1)* %284, align 4, !tbaa !9
  %289 = getelementptr inbounds float, float addrspace(1)* %0, i64 7
  store float %288, float addrspace(1)* %289, align 4, !tbaa !9
  %290 = getelementptr inbounds float, float addrspace(1)* %0, i64 211
  %291 = load float, float addrspace(1)* %290, align 4, !tbaa !9
  %292 = fmul contract float %291, 5.000000e-01
  %293 = fcmp contract olt float %292, 0.000000e+00
  %294 = select i1 %293, float 0x3FA1111120000000, float %292
  store float %294, float addrspace(1)* %290, align 4, !tbaa !9
  %295 = getelementptr inbounds float, float addrspace(1)* %0, i64 37
  store float %294, float addrspace(1)* %295, align 4, !tbaa !9
  %296 = getelementptr inbounds float, float addrspace(1)* %0, i64 212
  %297 = load float, float addrspace(1)* %296, align 4, !tbaa !9
  %298 = fmul contract float %297, 5.000000e-01
  %299 = fcmp contract olt float %298, 0.000000e+00
  %300 = select i1 %299, float 0x3FA1111120000000, float %298
  store float %300, float addrspace(1)* %296, align 4, !tbaa !9
  %301 = getelementptr inbounds float, float addrspace(1)* %0, i64 67
  store float %300, float addrspace(1)* %301, align 4, !tbaa !9
  %302 = getelementptr inbounds float, float addrspace(1)* %0, i64 213
  %303 = load float, float addrspace(1)* %302, align 4, !tbaa !9
  %304 = fmul contract float %303, 5.000000e-01
  %305 = fcmp contract olt float %304, 0.000000e+00
  %306 = select i1 %305, float 0x3FA1111120000000, float %304
  store float %306, float addrspace(1)* %302, align 4, !tbaa !9
  %307 = getelementptr inbounds float, float addrspace(1)* %0, i64 97
  store float %306, float addrspace(1)* %307, align 4, !tbaa !9
  %308 = getelementptr inbounds float, float addrspace(1)* %0, i64 214
  %309 = load float, float addrspace(1)* %308, align 4, !tbaa !9
  %310 = fmul contract float %309, 5.000000e-01
  %311 = fcmp contract olt float %310, 0.000000e+00
  %312 = select i1 %311, float 0x3FA1111120000000, float %310
  store float %312, float addrspace(1)* %308, align 4, !tbaa !9
  %313 = getelementptr inbounds float, float addrspace(1)* %0, i64 127
  store float %312, float addrspace(1)* %313, align 4, !tbaa !9
  %314 = getelementptr inbounds float, float addrspace(1)* %0, i64 215
  %315 = load float, float addrspace(1)* %314, align 4, !tbaa !9
  %316 = fmul contract float %315, 5.000000e-01
  %317 = fcmp contract olt float %316, 0.000000e+00
  %318 = select i1 %317, float 0x3FA1111120000000, float %316
  store float %318, float addrspace(1)* %314, align 4, !tbaa !9
  %319 = getelementptr inbounds float, float addrspace(1)* %0, i64 157
  store float %318, float addrspace(1)* %319, align 4, !tbaa !9
  %320 = getelementptr inbounds float, float addrspace(1)* %0, i64 216
  %321 = load float, float addrspace(1)* %320, align 4, !tbaa !9
  %322 = fmul contract float %321, 5.000000e-01
  %323 = fcmp contract olt float %322, 0.000000e+00
  %324 = select i1 %323, float 0x3FA1111120000000, float %322
  store float %324, float addrspace(1)* %320, align 4, !tbaa !9
  %325 = getelementptr inbounds float, float addrspace(1)* %0, i64 187
  store float %324, float addrspace(1)* %325, align 4, !tbaa !9
  %326 = getelementptr inbounds float, float addrspace(1)* %0, i64 240
  %327 = load float, float addrspace(1)* %326, align 4, !tbaa !9
  %328 = fmul contract float %327, 5.000000e-01
  %329 = fcmp contract olt float %328, 0.000000e+00
  %330 = select i1 %329, float 0x3FA1111120000000, float %328
  store float %330, float addrspace(1)* %326, align 4, !tbaa !9
  %331 = getelementptr inbounds float, float addrspace(1)* %0, i64 8
  store float %330, float addrspace(1)* %331, align 4, !tbaa !9
  %332 = getelementptr inbounds float, float addrspace(1)* %0, i64 241
  %333 = load float, float addrspace(1)* %332, align 4, !tbaa !9
  %334 = fmul contract float %333, 5.000000e-01
  %335 = fcmp contract olt float %334, 0.000000e+00
  %336 = select i1 %335, float 0x3FA1111120000000, float %334
  store float %336, float addrspace(1)* %332, align 4, !tbaa !9
  %337 = getelementptr inbounds float, float addrspace(1)* %0, i64 38
  store float %336, float addrspace(1)* %337, align 4, !tbaa !9
  %338 = getelementptr inbounds float, float addrspace(1)* %0, i64 242
  %339 = load float, float addrspace(1)* %338, align 4, !tbaa !9
  %340 = fmul contract float %339, 5.000000e-01
  %341 = fcmp contract olt float %340, 0.000000e+00
  %342 = select i1 %341, float 0x3FA1111120000000, float %340
  store float %342, float addrspace(1)* %338, align 4, !tbaa !9
  %343 = getelementptr inbounds float, float addrspace(1)* %0, i64 68
  store float %342, float addrspace(1)* %343, align 4, !tbaa !9
  %344 = getelementptr inbounds float, float addrspace(1)* %0, i64 243
  %345 = load float, float addrspace(1)* %344, align 4, !tbaa !9
  %346 = fmul contract float %345, 5.000000e-01
  %347 = fcmp contract olt float %346, 0.000000e+00
  %348 = select i1 %347, float 0x3FA1111120000000, float %346
  store float %348, float addrspace(1)* %344, align 4, !tbaa !9
  %349 = getelementptr inbounds float, float addrspace(1)* %0, i64 98
  store float %348, float addrspace(1)* %349, align 4, !tbaa !9
  %350 = getelementptr inbounds float, float addrspace(1)* %0, i64 244
  %351 = load float, float addrspace(1)* %350, align 4, !tbaa !9
  %352 = fmul contract float %351, 5.000000e-01
  %353 = fcmp contract olt float %352, 0.000000e+00
  %354 = select i1 %353, float 0x3FA1111120000000, float %352
  store float %354, float addrspace(1)* %350, align 4, !tbaa !9
  %355 = getelementptr inbounds float, float addrspace(1)* %0, i64 128
  store float %354, float addrspace(1)* %355, align 4, !tbaa !9
  %356 = getelementptr inbounds float, float addrspace(1)* %0, i64 245
  %357 = load float, float addrspace(1)* %356, align 4, !tbaa !9
  %358 = fmul contract float %357, 5.000000e-01
  %359 = fcmp contract olt float %358, 0.000000e+00
  %360 = select i1 %359, float 0x3FA1111120000000, float %358
  store float %360, float addrspace(1)* %356, align 4, !tbaa !9
  %361 = getelementptr inbounds float, float addrspace(1)* %0, i64 158
  store float %360, float addrspace(1)* %361, align 4, !tbaa !9
  %362 = getelementptr inbounds float, float addrspace(1)* %0, i64 246
  %363 = load float, float addrspace(1)* %362, align 4, !tbaa !9
  %364 = fmul contract float %363, 5.000000e-01
  %365 = fcmp contract olt float %364, 0.000000e+00
  %366 = select i1 %365, float 0x3FA1111120000000, float %364
  store float %366, float addrspace(1)* %362, align 4, !tbaa !9
  %367 = getelementptr inbounds float, float addrspace(1)* %0, i64 188
  store float %366, float addrspace(1)* %367, align 4, !tbaa !9
  %368 = getelementptr inbounds float, float addrspace(1)* %0, i64 247
  %369 = load float, float addrspace(1)* %368, align 4, !tbaa !9
  %370 = fmul contract float %369, 5.000000e-01
  %371 = fcmp contract olt float %370, 0.000000e+00
  %372 = select i1 %371, float 0x3FA1111120000000, float %370
  store float %372, float addrspace(1)* %368, align 4, !tbaa !9
  %373 = getelementptr inbounds float, float addrspace(1)* %0, i64 218
  store float %372, float addrspace(1)* %373, align 4, !tbaa !9
  %374 = getelementptr inbounds float, float addrspace(1)* %0, i64 270
  %375 = load float, float addrspace(1)* %374, align 4, !tbaa !9
  %376 = fmul contract float %375, 5.000000e-01
  %377 = fcmp contract olt float %376, 0.000000e+00
  %378 = select i1 %377, float 0x3FA1111120000000, float %376
  store float %378, float addrspace(1)* %374, align 4, !tbaa !9
  %379 = getelementptr inbounds float, float addrspace(1)* %0, i64 9
  store float %378, float addrspace(1)* %379, align 4, !tbaa !9
  %380 = getelementptr inbounds float, float addrspace(1)* %0, i64 271
  %381 = load float, float addrspace(1)* %380, align 4, !tbaa !9
  %382 = fmul contract float %381, 5.000000e-01
  %383 = fcmp contract olt float %382, 0.000000e+00
  %384 = select i1 %383, float 0x3FA1111120000000, float %382
  store float %384, float addrspace(1)* %380, align 4, !tbaa !9
  %385 = getelementptr inbounds float, float addrspace(1)* %0, i64 39
  store float %384, float addrspace(1)* %385, align 4, !tbaa !9
  %386 = getelementptr inbounds float, float addrspace(1)* %0, i64 272
  %387 = load float, float addrspace(1)* %386, align 4, !tbaa !9
  %388 = fmul contract float %387, 5.000000e-01
  %389 = fcmp contract olt float %388, 0.000000e+00
  %390 = select i1 %389, float 0x3FA1111120000000, float %388
  store float %390, float addrspace(1)* %386, align 4, !tbaa !9
  %391 = getelementptr inbounds float, float addrspace(1)* %0, i64 69
  store float %390, float addrspace(1)* %391, align 4, !tbaa !9
  %392 = getelementptr inbounds float, float addrspace(1)* %0, i64 273
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !9
  %394 = fmul contract float %393, 5.000000e-01
  %395 = fcmp contract olt float %394, 0.000000e+00
  %396 = select i1 %395, float 0x3FA1111120000000, float %394
  store float %396, float addrspace(1)* %392, align 4, !tbaa !9
  %397 = getelementptr inbounds float, float addrspace(1)* %0, i64 99
  store float %396, float addrspace(1)* %397, align 4, !tbaa !9
  %398 = getelementptr inbounds float, float addrspace(1)* %0, i64 274
  %399 = load float, float addrspace(1)* %398, align 4, !tbaa !9
  %400 = fmul contract float %399, 5.000000e-01
  %401 = fcmp contract olt float %400, 0.000000e+00
  %402 = select i1 %401, float 0x3FA1111120000000, float %400
  store float %402, float addrspace(1)* %398, align 4, !tbaa !9
  %403 = getelementptr inbounds float, float addrspace(1)* %0, i64 129
  store float %402, float addrspace(1)* %403, align 4, !tbaa !9
  %404 = getelementptr inbounds float, float addrspace(1)* %0, i64 275
  %405 = load float, float addrspace(1)* %404, align 4, !tbaa !9
  %406 = fmul contract float %405, 5.000000e-01
  %407 = fcmp contract olt float %406, 0.000000e+00
  %408 = select i1 %407, float 0x3FA1111120000000, float %406
  store float %408, float addrspace(1)* %404, align 4, !tbaa !9
  %409 = getelementptr inbounds float, float addrspace(1)* %0, i64 159
  store float %408, float addrspace(1)* %409, align 4, !tbaa !9
  %410 = getelementptr inbounds float, float addrspace(1)* %0, i64 276
  %411 = load float, float addrspace(1)* %410, align 4, !tbaa !9
  %412 = fmul contract float %411, 5.000000e-01
  %413 = fcmp contract olt float %412, 0.000000e+00
  %414 = select i1 %413, float 0x3FA1111120000000, float %412
  store float %414, float addrspace(1)* %410, align 4, !tbaa !9
  %415 = getelementptr inbounds float, float addrspace(1)* %0, i64 189
  store float %414, float addrspace(1)* %415, align 4, !tbaa !9
  %416 = getelementptr inbounds float, float addrspace(1)* %0, i64 277
  %417 = load float, float addrspace(1)* %416, align 4, !tbaa !9
  %418 = fmul contract float %417, 5.000000e-01
  %419 = fcmp contract olt float %418, 0.000000e+00
  %420 = select i1 %419, float 0x3FA1111120000000, float %418
  store float %420, float addrspace(1)* %416, align 4, !tbaa !9
  %421 = getelementptr inbounds float, float addrspace(1)* %0, i64 219
  store float %420, float addrspace(1)* %421, align 4, !tbaa !9
  %422 = getelementptr inbounds float, float addrspace(1)* %0, i64 278
  %423 = load float, float addrspace(1)* %422, align 4, !tbaa !9
  %424 = fmul contract float %423, 5.000000e-01
  %425 = fcmp contract olt float %424, 0.000000e+00
  %426 = select i1 %425, float 0x3FA1111120000000, float %424
  store float %426, float addrspace(1)* %422, align 4, !tbaa !9
  %427 = getelementptr inbounds float, float addrspace(1)* %0, i64 249
  store float %426, float addrspace(1)* %427, align 4, !tbaa !9
  %428 = getelementptr inbounds float, float addrspace(1)* %0, i64 300
  %429 = load float, float addrspace(1)* %428, align 4, !tbaa !9
  %430 = fmul contract float %429, 5.000000e-01
  %431 = fcmp contract olt float %430, 0.000000e+00
  %432 = select i1 %431, float 0x3FA1111120000000, float %430
  store float %432, float addrspace(1)* %428, align 4, !tbaa !9
  %433 = getelementptr inbounds float, float addrspace(1)* %0, i64 10
  store float %432, float addrspace(1)* %433, align 4, !tbaa !9
  %434 = getelementptr inbounds float, float addrspace(1)* %0, i64 301
  %435 = load float, float addrspace(1)* %434, align 4, !tbaa !9
  %436 = fmul contract float %435, 5.000000e-01
  %437 = fcmp contract olt float %436, 0.000000e+00
  %438 = select i1 %437, float 0x3FA1111120000000, float %436
  store float %438, float addrspace(1)* %434, align 4, !tbaa !9
  %439 = getelementptr inbounds float, float addrspace(1)* %0, i64 40
  store float %438, float addrspace(1)* %439, align 4, !tbaa !9
  %440 = getelementptr inbounds float, float addrspace(1)* %0, i64 302
  %441 = load float, float addrspace(1)* %440, align 4, !tbaa !9
  %442 = fmul contract float %441, 5.000000e-01
  %443 = fcmp contract olt float %442, 0.000000e+00
  %444 = select i1 %443, float 0x3FA1111120000000, float %442
  store float %444, float addrspace(1)* %440, align 4, !tbaa !9
  %445 = getelementptr inbounds float, float addrspace(1)* %0, i64 70
  store float %444, float addrspace(1)* %445, align 4, !tbaa !9
  %446 = getelementptr inbounds float, float addrspace(1)* %0, i64 303
  %447 = load float, float addrspace(1)* %446, align 4, !tbaa !9
  %448 = fmul contract float %447, 5.000000e-01
  %449 = fcmp contract olt float %448, 0.000000e+00
  %450 = select i1 %449, float 0x3FA1111120000000, float %448
  store float %450, float addrspace(1)* %446, align 4, !tbaa !9
  %451 = getelementptr inbounds float, float addrspace(1)* %0, i64 100
  store float %450, float addrspace(1)* %451, align 4, !tbaa !9
  %452 = getelementptr inbounds float, float addrspace(1)* %0, i64 304
  %453 = load float, float addrspace(1)* %452, align 4, !tbaa !9
  %454 = fmul contract float %453, 5.000000e-01
  %455 = fcmp contract olt float %454, 0.000000e+00
  %456 = select i1 %455, float 0x3FA1111120000000, float %454
  store float %456, float addrspace(1)* %452, align 4, !tbaa !9
  %457 = getelementptr inbounds float, float addrspace(1)* %0, i64 130
  store float %456, float addrspace(1)* %457, align 4, !tbaa !9
  %458 = getelementptr inbounds float, float addrspace(1)* %0, i64 305
  %459 = load float, float addrspace(1)* %458, align 4, !tbaa !9
  %460 = fmul contract float %459, 5.000000e-01
  %461 = fcmp contract olt float %460, 0.000000e+00
  %462 = select i1 %461, float 0x3FA1111120000000, float %460
  store float %462, float addrspace(1)* %458, align 4, !tbaa !9
  %463 = getelementptr inbounds float, float addrspace(1)* %0, i64 160
  store float %462, float addrspace(1)* %463, align 4, !tbaa !9
  %464 = getelementptr inbounds float, float addrspace(1)* %0, i64 306
  %465 = load float, float addrspace(1)* %464, align 4, !tbaa !9
  %466 = fmul contract float %465, 5.000000e-01
  %467 = fcmp contract olt float %466, 0.000000e+00
  %468 = select i1 %467, float 0x3FA1111120000000, float %466
  store float %468, float addrspace(1)* %464, align 4, !tbaa !9
  %469 = getelementptr inbounds float, float addrspace(1)* %0, i64 190
  store float %468, float addrspace(1)* %469, align 4, !tbaa !9
  %470 = getelementptr inbounds float, float addrspace(1)* %0, i64 307
  %471 = load float, float addrspace(1)* %470, align 4, !tbaa !9
  %472 = fmul contract float %471, 5.000000e-01
  %473 = fcmp contract olt float %472, 0.000000e+00
  %474 = select i1 %473, float 0x3FA1111120000000, float %472
  store float %474, float addrspace(1)* %470, align 4, !tbaa !9
  %475 = getelementptr inbounds float, float addrspace(1)* %0, i64 220
  store float %474, float addrspace(1)* %475, align 4, !tbaa !9
  %476 = getelementptr inbounds float, float addrspace(1)* %0, i64 308
  %477 = load float, float addrspace(1)* %476, align 4, !tbaa !9
  %478 = fmul contract float %477, 5.000000e-01
  %479 = fcmp contract olt float %478, 0.000000e+00
  %480 = select i1 %479, float 0x3FA1111120000000, float %478
  store float %480, float addrspace(1)* %476, align 4, !tbaa !9
  %481 = getelementptr inbounds float, float addrspace(1)* %0, i64 250
  store float %480, float addrspace(1)* %481, align 4, !tbaa !9
  %482 = getelementptr inbounds float, float addrspace(1)* %0, i64 309
  %483 = load float, float addrspace(1)* %482, align 4, !tbaa !9
  %484 = fmul contract float %483, 5.000000e-01
  %485 = fcmp contract olt float %484, 0.000000e+00
  %486 = select i1 %485, float 0x3FA1111120000000, float %484
  store float %486, float addrspace(1)* %482, align 4, !tbaa !9
  %487 = getelementptr inbounds float, float addrspace(1)* %0, i64 280
  store float %486, float addrspace(1)* %487, align 4, !tbaa !9
  %488 = getelementptr inbounds float, float addrspace(1)* %0, i64 330
  %489 = load float, float addrspace(1)* %488, align 4, !tbaa !9
  %490 = fmul contract float %489, 5.000000e-01
  %491 = fcmp contract olt float %490, 0.000000e+00
  %492 = select i1 %491, float 0x3FA1111120000000, float %490
  store float %492, float addrspace(1)* %488, align 4, !tbaa !9
  %493 = getelementptr inbounds float, float addrspace(1)* %0, i64 11
  store float %492, float addrspace(1)* %493, align 4, !tbaa !9
  %494 = getelementptr inbounds float, float addrspace(1)* %0, i64 331
  %495 = load float, float addrspace(1)* %494, align 4, !tbaa !9
  %496 = fmul contract float %495, 5.000000e-01
  %497 = fcmp contract olt float %496, 0.000000e+00
  %498 = select i1 %497, float 0x3FA1111120000000, float %496
  store float %498, float addrspace(1)* %494, align 4, !tbaa !9
  %499 = getelementptr inbounds float, float addrspace(1)* %0, i64 41
  store float %498, float addrspace(1)* %499, align 4, !tbaa !9
  %500 = getelementptr inbounds float, float addrspace(1)* %0, i64 332
  %501 = load float, float addrspace(1)* %500, align 4, !tbaa !9
  %502 = fmul contract float %501, 5.000000e-01
  %503 = fcmp contract olt float %502, 0.000000e+00
  %504 = select i1 %503, float 0x3FA1111120000000, float %502
  store float %504, float addrspace(1)* %500, align 4, !tbaa !9
  %505 = getelementptr inbounds float, float addrspace(1)* %0, i64 71
  store float %504, float addrspace(1)* %505, align 4, !tbaa !9
  %506 = getelementptr inbounds float, float addrspace(1)* %0, i64 333
  %507 = load float, float addrspace(1)* %506, align 4, !tbaa !9
  %508 = fmul contract float %507, 5.000000e-01
  %509 = fcmp contract olt float %508, 0.000000e+00
  %510 = select i1 %509, float 0x3FA1111120000000, float %508
  store float %510, float addrspace(1)* %506, align 4, !tbaa !9
  %511 = getelementptr inbounds float, float addrspace(1)* %0, i64 101
  store float %510, float addrspace(1)* %511, align 4, !tbaa !9
  %512 = getelementptr inbounds float, float addrspace(1)* %0, i64 334
  %513 = load float, float addrspace(1)* %512, align 4, !tbaa !9
  %514 = fmul contract float %513, 5.000000e-01
  %515 = fcmp contract olt float %514, 0.000000e+00
  %516 = select i1 %515, float 0x3FA1111120000000, float %514
  store float %516, float addrspace(1)* %512, align 4, !tbaa !9
  %517 = getelementptr inbounds float, float addrspace(1)* %0, i64 131
  store float %516, float addrspace(1)* %517, align 4, !tbaa !9
  %518 = getelementptr inbounds float, float addrspace(1)* %0, i64 335
  %519 = load float, float addrspace(1)* %518, align 4, !tbaa !9
  %520 = fmul contract float %519, 5.000000e-01
  %521 = fcmp contract olt float %520, 0.000000e+00
  %522 = select i1 %521, float 0x3FA1111120000000, float %520
  store float %522, float addrspace(1)* %518, align 4, !tbaa !9
  %523 = getelementptr inbounds float, float addrspace(1)* %0, i64 161
  store float %522, float addrspace(1)* %523, align 4, !tbaa !9
  %524 = getelementptr inbounds float, float addrspace(1)* %0, i64 336
  %525 = load float, float addrspace(1)* %524, align 4, !tbaa !9
  %526 = fmul contract float %525, 5.000000e-01
  %527 = fcmp contract olt float %526, 0.000000e+00
  %528 = select i1 %527, float 0x3FA1111120000000, float %526
  store float %528, float addrspace(1)* %524, align 4, !tbaa !9
  %529 = getelementptr inbounds float, float addrspace(1)* %0, i64 191
  store float %528, float addrspace(1)* %529, align 4, !tbaa !9
  %530 = getelementptr inbounds float, float addrspace(1)* %0, i64 337
  %531 = load float, float addrspace(1)* %530, align 4, !tbaa !9
  %532 = fmul contract float %531, 5.000000e-01
  %533 = fcmp contract olt float %532, 0.000000e+00
  %534 = select i1 %533, float 0x3FA1111120000000, float %532
  store float %534, float addrspace(1)* %530, align 4, !tbaa !9
  %535 = getelementptr inbounds float, float addrspace(1)* %0, i64 221
  store float %534, float addrspace(1)* %535, align 4, !tbaa !9
  %536 = getelementptr inbounds float, float addrspace(1)* %0, i64 338
  %537 = load float, float addrspace(1)* %536, align 4, !tbaa !9
  %538 = fmul contract float %537, 5.000000e-01
  %539 = fcmp contract olt float %538, 0.000000e+00
  %540 = select i1 %539, float 0x3FA1111120000000, float %538
  store float %540, float addrspace(1)* %536, align 4, !tbaa !9
  %541 = getelementptr inbounds float, float addrspace(1)* %0, i64 251
  store float %540, float addrspace(1)* %541, align 4, !tbaa !9
  %542 = getelementptr inbounds float, float addrspace(1)* %0, i64 339
  %543 = load float, float addrspace(1)* %542, align 4, !tbaa !9
  %544 = fmul contract float %543, 5.000000e-01
  %545 = fcmp contract olt float %544, 0.000000e+00
  %546 = select i1 %545, float 0x3FA1111120000000, float %544
  store float %546, float addrspace(1)* %542, align 4, !tbaa !9
  %547 = getelementptr inbounds float, float addrspace(1)* %0, i64 281
  store float %546, float addrspace(1)* %547, align 4, !tbaa !9
  %548 = getelementptr inbounds float, float addrspace(1)* %0, i64 340
  %549 = load float, float addrspace(1)* %548, align 4, !tbaa !9
  %550 = fmul contract float %549, 5.000000e-01
  %551 = fcmp contract olt float %550, 0.000000e+00
  %552 = select i1 %551, float 0x3FA1111120000000, float %550
  store float %552, float addrspace(1)* %548, align 4, !tbaa !9
  %553 = getelementptr inbounds float, float addrspace(1)* %0, i64 311
  store float %552, float addrspace(1)* %553, align 4, !tbaa !9
  %554 = getelementptr inbounds float, float addrspace(1)* %0, i64 360
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !9
  %556 = fmul contract float %555, 5.000000e-01
  %557 = fcmp contract olt float %556, 0.000000e+00
  %558 = select i1 %557, float 0x3FA1111120000000, float %556
  store float %558, float addrspace(1)* %554, align 4, !tbaa !9
  %559 = getelementptr inbounds float, float addrspace(1)* %0, i64 12
  store float %558, float addrspace(1)* %559, align 4, !tbaa !9
  %560 = getelementptr inbounds float, float addrspace(1)* %0, i64 361
  %561 = load float, float addrspace(1)* %560, align 4, !tbaa !9
  %562 = fmul contract float %561, 5.000000e-01
  %563 = fcmp contract olt float %562, 0.000000e+00
  %564 = select i1 %563, float 0x3FA1111120000000, float %562
  store float %564, float addrspace(1)* %560, align 4, !tbaa !9
  %565 = getelementptr inbounds float, float addrspace(1)* %0, i64 42
  store float %564, float addrspace(1)* %565, align 4, !tbaa !9
  %566 = getelementptr inbounds float, float addrspace(1)* %0, i64 362
  %567 = load float, float addrspace(1)* %566, align 4, !tbaa !9
  %568 = fmul contract float %567, 5.000000e-01
  %569 = fcmp contract olt float %568, 0.000000e+00
  %570 = select i1 %569, float 0x3FA1111120000000, float %568
  store float %570, float addrspace(1)* %566, align 4, !tbaa !9
  %571 = getelementptr inbounds float, float addrspace(1)* %0, i64 72
  store float %570, float addrspace(1)* %571, align 4, !tbaa !9
  %572 = getelementptr inbounds float, float addrspace(1)* %0, i64 363
  %573 = load float, float addrspace(1)* %572, align 4, !tbaa !9
  %574 = fmul contract float %573, 5.000000e-01
  %575 = fcmp contract olt float %574, 0.000000e+00
  %576 = select i1 %575, float 0x3FA1111120000000, float %574
  store float %576, float addrspace(1)* %572, align 4, !tbaa !9
  %577 = getelementptr inbounds float, float addrspace(1)* %0, i64 102
  store float %576, float addrspace(1)* %577, align 4, !tbaa !9
  %578 = getelementptr inbounds float, float addrspace(1)* %0, i64 364
  %579 = load float, float addrspace(1)* %578, align 4, !tbaa !9
  %580 = fmul contract float %579, 5.000000e-01
  %581 = fcmp contract olt float %580, 0.000000e+00
  %582 = select i1 %581, float 0x3FA1111120000000, float %580
  store float %582, float addrspace(1)* %578, align 4, !tbaa !9
  %583 = getelementptr inbounds float, float addrspace(1)* %0, i64 132
  store float %582, float addrspace(1)* %583, align 4, !tbaa !9
  %584 = getelementptr inbounds float, float addrspace(1)* %0, i64 365
  %585 = load float, float addrspace(1)* %584, align 4, !tbaa !9
  %586 = fmul contract float %585, 5.000000e-01
  %587 = fcmp contract olt float %586, 0.000000e+00
  %588 = select i1 %587, float 0x3FA1111120000000, float %586
  store float %588, float addrspace(1)* %584, align 4, !tbaa !9
  %589 = getelementptr inbounds float, float addrspace(1)* %0, i64 162
  store float %588, float addrspace(1)* %589, align 4, !tbaa !9
  %590 = getelementptr inbounds float, float addrspace(1)* %0, i64 366
  %591 = load float, float addrspace(1)* %590, align 4, !tbaa !9
  %592 = fmul contract float %591, 5.000000e-01
  %593 = fcmp contract olt float %592, 0.000000e+00
  %594 = select i1 %593, float 0x3FA1111120000000, float %592
  store float %594, float addrspace(1)* %590, align 4, !tbaa !9
  %595 = getelementptr inbounds float, float addrspace(1)* %0, i64 192
  store float %594, float addrspace(1)* %595, align 4, !tbaa !9
  %596 = getelementptr inbounds float, float addrspace(1)* %0, i64 367
  %597 = load float, float addrspace(1)* %596, align 4, !tbaa !9
  %598 = fmul contract float %597, 5.000000e-01
  %599 = fcmp contract olt float %598, 0.000000e+00
  %600 = select i1 %599, float 0x3FA1111120000000, float %598
  store float %600, float addrspace(1)* %596, align 4, !tbaa !9
  %601 = getelementptr inbounds float, float addrspace(1)* %0, i64 222
  store float %600, float addrspace(1)* %601, align 4, !tbaa !9
  %602 = getelementptr inbounds float, float addrspace(1)* %0, i64 368
  %603 = load float, float addrspace(1)* %602, align 4, !tbaa !9
  %604 = fmul contract float %603, 5.000000e-01
  %605 = fcmp contract olt float %604, 0.000000e+00
  %606 = select i1 %605, float 0x3FA1111120000000, float %604
  store float %606, float addrspace(1)* %602, align 4, !tbaa !9
  %607 = getelementptr inbounds float, float addrspace(1)* %0, i64 252
  store float %606, float addrspace(1)* %607, align 4, !tbaa !9
  %608 = getelementptr inbounds float, float addrspace(1)* %0, i64 369
  %609 = load float, float addrspace(1)* %608, align 4, !tbaa !9
  %610 = fmul contract float %609, 5.000000e-01
  %611 = fcmp contract olt float %610, 0.000000e+00
  %612 = select i1 %611, float 0x3FA1111120000000, float %610
  store float %612, float addrspace(1)* %608, align 4, !tbaa !9
  %613 = getelementptr inbounds float, float addrspace(1)* %0, i64 282
  store float %612, float addrspace(1)* %613, align 4, !tbaa !9
  %614 = getelementptr inbounds float, float addrspace(1)* %0, i64 370
  %615 = load float, float addrspace(1)* %614, align 4, !tbaa !9
  %616 = fmul contract float %615, 5.000000e-01
  %617 = fcmp contract olt float %616, 0.000000e+00
  %618 = select i1 %617, float 0x3FA1111120000000, float %616
  store float %618, float addrspace(1)* %614, align 4, !tbaa !9
  %619 = getelementptr inbounds float, float addrspace(1)* %0, i64 312
  store float %618, float addrspace(1)* %619, align 4, !tbaa !9
  %620 = getelementptr inbounds float, float addrspace(1)* %0, i64 371
  %621 = load float, float addrspace(1)* %620, align 4, !tbaa !9
  %622 = fmul contract float %621, 5.000000e-01
  %623 = fcmp contract olt float %622, 0.000000e+00
  %624 = select i1 %623, float 0x3FA1111120000000, float %622
  store float %624, float addrspace(1)* %620, align 4, !tbaa !9
  %625 = getelementptr inbounds float, float addrspace(1)* %0, i64 342
  store float %624, float addrspace(1)* %625, align 4, !tbaa !9
  %626 = getelementptr inbounds float, float addrspace(1)* %0, i64 390
  %627 = load float, float addrspace(1)* %626, align 4, !tbaa !9
  %628 = fmul contract float %627, 5.000000e-01
  %629 = fcmp contract olt float %628, 0.000000e+00
  %630 = select i1 %629, float 0x3FA1111120000000, float %628
  store float %630, float addrspace(1)* %626, align 4, !tbaa !9
  %631 = getelementptr inbounds float, float addrspace(1)* %0, i64 13
  store float %630, float addrspace(1)* %631, align 4, !tbaa !9
  %632 = getelementptr inbounds float, float addrspace(1)* %0, i64 391
  %633 = load float, float addrspace(1)* %632, align 4, !tbaa !9
  %634 = fmul contract float %633, 5.000000e-01
  %635 = fcmp contract olt float %634, 0.000000e+00
  %636 = select i1 %635, float 0x3FA1111120000000, float %634
  store float %636, float addrspace(1)* %632, align 4, !tbaa !9
  %637 = getelementptr inbounds float, float addrspace(1)* %0, i64 43
  store float %636, float addrspace(1)* %637, align 4, !tbaa !9
  %638 = getelementptr inbounds float, float addrspace(1)* %0, i64 392
  %639 = load float, float addrspace(1)* %638, align 4, !tbaa !9
  %640 = fmul contract float %639, 5.000000e-01
  %641 = fcmp contract olt float %640, 0.000000e+00
  %642 = select i1 %641, float 0x3FA1111120000000, float %640
  store float %642, float addrspace(1)* %638, align 4, !tbaa !9
  %643 = getelementptr inbounds float, float addrspace(1)* %0, i64 73
  store float %642, float addrspace(1)* %643, align 4, !tbaa !9
  %644 = getelementptr inbounds float, float addrspace(1)* %0, i64 393
  %645 = load float, float addrspace(1)* %644, align 4, !tbaa !9
  %646 = fmul contract float %645, 5.000000e-01
  %647 = fcmp contract olt float %646, 0.000000e+00
  %648 = select i1 %647, float 0x3FA1111120000000, float %646
  store float %648, float addrspace(1)* %644, align 4, !tbaa !9
  %649 = getelementptr inbounds float, float addrspace(1)* %0, i64 103
  store float %648, float addrspace(1)* %649, align 4, !tbaa !9
  %650 = getelementptr inbounds float, float addrspace(1)* %0, i64 394
  %651 = load float, float addrspace(1)* %650, align 4, !tbaa !9
  %652 = fmul contract float %651, 5.000000e-01
  %653 = fcmp contract olt float %652, 0.000000e+00
  %654 = select i1 %653, float 0x3FA1111120000000, float %652
  store float %654, float addrspace(1)* %650, align 4, !tbaa !9
  %655 = getelementptr inbounds float, float addrspace(1)* %0, i64 133
  store float %654, float addrspace(1)* %655, align 4, !tbaa !9
  %656 = getelementptr inbounds float, float addrspace(1)* %0, i64 395
  %657 = load float, float addrspace(1)* %656, align 4, !tbaa !9
  %658 = fmul contract float %657, 5.000000e-01
  %659 = fcmp contract olt float %658, 0.000000e+00
  %660 = select i1 %659, float 0x3FA1111120000000, float %658
  store float %660, float addrspace(1)* %656, align 4, !tbaa !9
  %661 = getelementptr inbounds float, float addrspace(1)* %0, i64 163
  store float %660, float addrspace(1)* %661, align 4, !tbaa !9
  %662 = getelementptr inbounds float, float addrspace(1)* %0, i64 396
  %663 = load float, float addrspace(1)* %662, align 4, !tbaa !9
  %664 = fmul contract float %663, 5.000000e-01
  %665 = fcmp contract olt float %664, 0.000000e+00
  %666 = select i1 %665, float 0x3FA1111120000000, float %664
  store float %666, float addrspace(1)* %662, align 4, !tbaa !9
  %667 = getelementptr inbounds float, float addrspace(1)* %0, i64 193
  store float %666, float addrspace(1)* %667, align 4, !tbaa !9
  %668 = getelementptr inbounds float, float addrspace(1)* %0, i64 397
  %669 = load float, float addrspace(1)* %668, align 4, !tbaa !9
  %670 = fmul contract float %669, 5.000000e-01
  %671 = fcmp contract olt float %670, 0.000000e+00
  %672 = select i1 %671, float 0x3FA1111120000000, float %670
  store float %672, float addrspace(1)* %668, align 4, !tbaa !9
  %673 = getelementptr inbounds float, float addrspace(1)* %0, i64 223
  store float %672, float addrspace(1)* %673, align 4, !tbaa !9
  %674 = getelementptr inbounds float, float addrspace(1)* %0, i64 398
  %675 = load float, float addrspace(1)* %674, align 4, !tbaa !9
  %676 = fmul contract float %675, 5.000000e-01
  %677 = fcmp contract olt float %676, 0.000000e+00
  %678 = select i1 %677, float 0x3FA1111120000000, float %676
  store float %678, float addrspace(1)* %674, align 4, !tbaa !9
  %679 = getelementptr inbounds float, float addrspace(1)* %0, i64 253
  store float %678, float addrspace(1)* %679, align 4, !tbaa !9
  %680 = getelementptr inbounds float, float addrspace(1)* %0, i64 399
  %681 = load float, float addrspace(1)* %680, align 4, !tbaa !9
  %682 = fmul contract float %681, 5.000000e-01
  %683 = fcmp contract olt float %682, 0.000000e+00
  %684 = select i1 %683, float 0x3FA1111120000000, float %682
  store float %684, float addrspace(1)* %680, align 4, !tbaa !9
  %685 = getelementptr inbounds float, float addrspace(1)* %0, i64 283
  store float %684, float addrspace(1)* %685, align 4, !tbaa !9
  %686 = getelementptr inbounds float, float addrspace(1)* %0, i64 400
  %687 = load float, float addrspace(1)* %686, align 4, !tbaa !9
  %688 = fmul contract float %687, 5.000000e-01
  %689 = fcmp contract olt float %688, 0.000000e+00
  %690 = select i1 %689, float 0x3FA1111120000000, float %688
  store float %690, float addrspace(1)* %686, align 4, !tbaa !9
  %691 = getelementptr inbounds float, float addrspace(1)* %0, i64 313
  store float %690, float addrspace(1)* %691, align 4, !tbaa !9
  %692 = getelementptr inbounds float, float addrspace(1)* %0, i64 401
  %693 = load float, float addrspace(1)* %692, align 4, !tbaa !9
  %694 = fmul contract float %693, 5.000000e-01
  %695 = fcmp contract olt float %694, 0.000000e+00
  %696 = select i1 %695, float 0x3FA1111120000000, float %694
  store float %696, float addrspace(1)* %692, align 4, !tbaa !9
  %697 = getelementptr inbounds float, float addrspace(1)* %0, i64 343
  store float %696, float addrspace(1)* %697, align 4, !tbaa !9
  %698 = getelementptr inbounds float, float addrspace(1)* %0, i64 402
  %699 = load float, float addrspace(1)* %698, align 4, !tbaa !9
  %700 = fmul contract float %699, 5.000000e-01
  %701 = fcmp contract olt float %700, 0.000000e+00
  %702 = select i1 %701, float 0x3FA1111120000000, float %700
  store float %702, float addrspace(1)* %698, align 4, !tbaa !9
  %703 = getelementptr inbounds float, float addrspace(1)* %0, i64 373
  store float %702, float addrspace(1)* %703, align 4, !tbaa !9
  %704 = getelementptr inbounds float, float addrspace(1)* %0, i64 420
  %705 = load float, float addrspace(1)* %704, align 4, !tbaa !9
  %706 = fmul contract float %705, 5.000000e-01
  %707 = fcmp contract olt float %706, 0.000000e+00
  %708 = select i1 %707, float 0x3FA1111120000000, float %706
  store float %708, float addrspace(1)* %704, align 4, !tbaa !9
  %709 = getelementptr inbounds float, float addrspace(1)* %0, i64 14
  store float %708, float addrspace(1)* %709, align 4, !tbaa !9
  %710 = getelementptr inbounds float, float addrspace(1)* %0, i64 421
  %711 = load float, float addrspace(1)* %710, align 4, !tbaa !9
  %712 = fmul contract float %711, 5.000000e-01
  %713 = fcmp contract olt float %712, 0.000000e+00
  %714 = select i1 %713, float 0x3FA1111120000000, float %712
  store float %714, float addrspace(1)* %710, align 4, !tbaa !9
  %715 = getelementptr inbounds float, float addrspace(1)* %0, i64 44
  store float %714, float addrspace(1)* %715, align 4, !tbaa !9
  %716 = getelementptr inbounds float, float addrspace(1)* %0, i64 422
  %717 = load float, float addrspace(1)* %716, align 4, !tbaa !9
  %718 = fmul contract float %717, 5.000000e-01
  %719 = fcmp contract olt float %718, 0.000000e+00
  %720 = select i1 %719, float 0x3FA1111120000000, float %718
  store float %720, float addrspace(1)* %716, align 4, !tbaa !9
  %721 = getelementptr inbounds float, float addrspace(1)* %0, i64 74
  store float %720, float addrspace(1)* %721, align 4, !tbaa !9
  %722 = getelementptr inbounds float, float addrspace(1)* %0, i64 423
  %723 = load float, float addrspace(1)* %722, align 4, !tbaa !9
  %724 = fmul contract float %723, 5.000000e-01
  %725 = fcmp contract olt float %724, 0.000000e+00
  %726 = select i1 %725, float 0x3FA1111120000000, float %724
  store float %726, float addrspace(1)* %722, align 4, !tbaa !9
  %727 = getelementptr inbounds float, float addrspace(1)* %0, i64 104
  store float %726, float addrspace(1)* %727, align 4, !tbaa !9
  %728 = getelementptr inbounds float, float addrspace(1)* %0, i64 424
  %729 = load float, float addrspace(1)* %728, align 4, !tbaa !9
  %730 = fmul contract float %729, 5.000000e-01
  %731 = fcmp contract olt float %730, 0.000000e+00
  %732 = select i1 %731, float 0x3FA1111120000000, float %730
  store float %732, float addrspace(1)* %728, align 4, !tbaa !9
  %733 = getelementptr inbounds float, float addrspace(1)* %0, i64 134
  store float %732, float addrspace(1)* %733, align 4, !tbaa !9
  %734 = getelementptr inbounds float, float addrspace(1)* %0, i64 425
  %735 = load float, float addrspace(1)* %734, align 4, !tbaa !9
  %736 = fmul contract float %735, 5.000000e-01
  %737 = fcmp contract olt float %736, 0.000000e+00
  %738 = select i1 %737, float 0x3FA1111120000000, float %736
  store float %738, float addrspace(1)* %734, align 4, !tbaa !9
  %739 = getelementptr inbounds float, float addrspace(1)* %0, i64 164
  store float %738, float addrspace(1)* %739, align 4, !tbaa !9
  %740 = getelementptr inbounds float, float addrspace(1)* %0, i64 426
  %741 = load float, float addrspace(1)* %740, align 4, !tbaa !9
  %742 = fmul contract float %741, 5.000000e-01
  %743 = fcmp contract olt float %742, 0.000000e+00
  %744 = select i1 %743, float 0x3FA1111120000000, float %742
  store float %744, float addrspace(1)* %740, align 4, !tbaa !9
  %745 = getelementptr inbounds float, float addrspace(1)* %0, i64 194
  store float %744, float addrspace(1)* %745, align 4, !tbaa !9
  %746 = getelementptr inbounds float, float addrspace(1)* %0, i64 427
  %747 = load float, float addrspace(1)* %746, align 4, !tbaa !9
  %748 = fmul contract float %747, 5.000000e-01
  %749 = fcmp contract olt float %748, 0.000000e+00
  %750 = select i1 %749, float 0x3FA1111120000000, float %748
  store float %750, float addrspace(1)* %746, align 4, !tbaa !9
  %751 = getelementptr inbounds float, float addrspace(1)* %0, i64 224
  store float %750, float addrspace(1)* %751, align 4, !tbaa !9
  %752 = getelementptr inbounds float, float addrspace(1)* %0, i64 428
  %753 = load float, float addrspace(1)* %752, align 4, !tbaa !9
  %754 = fmul contract float %753, 5.000000e-01
  %755 = fcmp contract olt float %754, 0.000000e+00
  %756 = select i1 %755, float 0x3FA1111120000000, float %754
  store float %756, float addrspace(1)* %752, align 4, !tbaa !9
  %757 = getelementptr inbounds float, float addrspace(1)* %0, i64 254
  store float %756, float addrspace(1)* %757, align 4, !tbaa !9
  %758 = getelementptr inbounds float, float addrspace(1)* %0, i64 429
  %759 = load float, float addrspace(1)* %758, align 4, !tbaa !9
  %760 = fmul contract float %759, 5.000000e-01
  %761 = fcmp contract olt float %760, 0.000000e+00
  %762 = select i1 %761, float 0x3FA1111120000000, float %760
  store float %762, float addrspace(1)* %758, align 4, !tbaa !9
  %763 = getelementptr inbounds float, float addrspace(1)* %0, i64 284
  store float %762, float addrspace(1)* %763, align 4, !tbaa !9
  %764 = getelementptr inbounds float, float addrspace(1)* %0, i64 430
  %765 = load float, float addrspace(1)* %764, align 4, !tbaa !9
  %766 = fmul contract float %765, 5.000000e-01
  %767 = fcmp contract olt float %766, 0.000000e+00
  %768 = select i1 %767, float 0x3FA1111120000000, float %766
  store float %768, float addrspace(1)* %764, align 4, !tbaa !9
  %769 = getelementptr inbounds float, float addrspace(1)* %0, i64 314
  store float %768, float addrspace(1)* %769, align 4, !tbaa !9
  %770 = getelementptr inbounds float, float addrspace(1)* %0, i64 431
  %771 = load float, float addrspace(1)* %770, align 4, !tbaa !9
  %772 = fmul contract float %771, 5.000000e-01
  %773 = fcmp contract olt float %772, 0.000000e+00
  %774 = select i1 %773, float 0x3FA1111120000000, float %772
  store float %774, float addrspace(1)* %770, align 4, !tbaa !9
  %775 = getelementptr inbounds float, float addrspace(1)* %0, i64 344
  store float %774, float addrspace(1)* %775, align 4, !tbaa !9
  %776 = getelementptr inbounds float, float addrspace(1)* %0, i64 432
  %777 = load float, float addrspace(1)* %776, align 4, !tbaa !9
  %778 = fmul contract float %777, 5.000000e-01
  %779 = fcmp contract olt float %778, 0.000000e+00
  %780 = select i1 %779, float 0x3FA1111120000000, float %778
  store float %780, float addrspace(1)* %776, align 4, !tbaa !9
  %781 = getelementptr inbounds float, float addrspace(1)* %0, i64 374
  store float %780, float addrspace(1)* %781, align 4, !tbaa !9
  %782 = getelementptr inbounds float, float addrspace(1)* %0, i64 433
  %783 = load float, float addrspace(1)* %782, align 4, !tbaa !9
  %784 = fmul contract float %783, 5.000000e-01
  %785 = fcmp contract olt float %784, 0.000000e+00
  %786 = select i1 %785, float 0x3FA1111120000000, float %784
  store float %786, float addrspace(1)* %782, align 4, !tbaa !9
  %787 = getelementptr inbounds float, float addrspace(1)* %0, i64 404
  store float %786, float addrspace(1)* %787, align 4, !tbaa !9
  %788 = getelementptr inbounds float, float addrspace(1)* %0, i64 450
  %789 = load float, float addrspace(1)* %788, align 4, !tbaa !9
  %790 = fmul contract float %789, 5.000000e-01
  %791 = fcmp contract olt float %790, 0.000000e+00
  %792 = select i1 %791, float 0x3FA1111120000000, float %790
  store float %792, float addrspace(1)* %788, align 4, !tbaa !9
  %793 = getelementptr inbounds float, float addrspace(1)* %0, i64 15
  store float %792, float addrspace(1)* %793, align 4, !tbaa !9
  %794 = getelementptr inbounds float, float addrspace(1)* %0, i64 451
  %795 = load float, float addrspace(1)* %794, align 4, !tbaa !9
  %796 = fmul contract float %795, 5.000000e-01
  %797 = fcmp contract olt float %796, 0.000000e+00
  %798 = select i1 %797, float 0x3FA1111120000000, float %796
  store float %798, float addrspace(1)* %794, align 4, !tbaa !9
  %799 = getelementptr inbounds float, float addrspace(1)* %0, i64 45
  store float %798, float addrspace(1)* %799, align 4, !tbaa !9
  %800 = getelementptr inbounds float, float addrspace(1)* %0, i64 452
  %801 = load float, float addrspace(1)* %800, align 4, !tbaa !9
  %802 = fmul contract float %801, 5.000000e-01
  %803 = fcmp contract olt float %802, 0.000000e+00
  %804 = select i1 %803, float 0x3FA1111120000000, float %802
  store float %804, float addrspace(1)* %800, align 4, !tbaa !9
  %805 = getelementptr inbounds float, float addrspace(1)* %0, i64 75
  store float %804, float addrspace(1)* %805, align 4, !tbaa !9
  %806 = getelementptr inbounds float, float addrspace(1)* %0, i64 453
  %807 = load float, float addrspace(1)* %806, align 4, !tbaa !9
  %808 = fmul contract float %807, 5.000000e-01
  %809 = fcmp contract olt float %808, 0.000000e+00
  %810 = select i1 %809, float 0x3FA1111120000000, float %808
  store float %810, float addrspace(1)* %806, align 4, !tbaa !9
  %811 = getelementptr inbounds float, float addrspace(1)* %0, i64 105
  store float %810, float addrspace(1)* %811, align 4, !tbaa !9
  %812 = getelementptr inbounds float, float addrspace(1)* %0, i64 454
  %813 = load float, float addrspace(1)* %812, align 4, !tbaa !9
  %814 = fmul contract float %813, 5.000000e-01
  %815 = fcmp contract olt float %814, 0.000000e+00
  %816 = select i1 %815, float 0x3FA1111120000000, float %814
  store float %816, float addrspace(1)* %812, align 4, !tbaa !9
  %817 = getelementptr inbounds float, float addrspace(1)* %0, i64 135
  store float %816, float addrspace(1)* %817, align 4, !tbaa !9
  %818 = getelementptr inbounds float, float addrspace(1)* %0, i64 455
  %819 = load float, float addrspace(1)* %818, align 4, !tbaa !9
  %820 = fmul contract float %819, 5.000000e-01
  %821 = fcmp contract olt float %820, 0.000000e+00
  %822 = select i1 %821, float 0x3FA1111120000000, float %820
  store float %822, float addrspace(1)* %818, align 4, !tbaa !9
  %823 = getelementptr inbounds float, float addrspace(1)* %0, i64 165
  store float %822, float addrspace(1)* %823, align 4, !tbaa !9
  %824 = getelementptr inbounds float, float addrspace(1)* %0, i64 456
  %825 = load float, float addrspace(1)* %824, align 4, !tbaa !9
  %826 = fmul contract float %825, 5.000000e-01
  %827 = fcmp contract olt float %826, 0.000000e+00
  %828 = select i1 %827, float 0x3FA1111120000000, float %826
  store float %828, float addrspace(1)* %824, align 4, !tbaa !9
  %829 = getelementptr inbounds float, float addrspace(1)* %0, i64 195
  store float %828, float addrspace(1)* %829, align 4, !tbaa !9
  %830 = getelementptr inbounds float, float addrspace(1)* %0, i64 457
  %831 = load float, float addrspace(1)* %830, align 4, !tbaa !9
  %832 = fmul contract float %831, 5.000000e-01
  %833 = fcmp contract olt float %832, 0.000000e+00
  %834 = select i1 %833, float 0x3FA1111120000000, float %832
  store float %834, float addrspace(1)* %830, align 4, !tbaa !9
  %835 = getelementptr inbounds float, float addrspace(1)* %0, i64 225
  store float %834, float addrspace(1)* %835, align 4, !tbaa !9
  %836 = getelementptr inbounds float, float addrspace(1)* %0, i64 458
  %837 = load float, float addrspace(1)* %836, align 4, !tbaa !9
  %838 = fmul contract float %837, 5.000000e-01
  %839 = fcmp contract olt float %838, 0.000000e+00
  %840 = select i1 %839, float 0x3FA1111120000000, float %838
  store float %840, float addrspace(1)* %836, align 4, !tbaa !9
  %841 = getelementptr inbounds float, float addrspace(1)* %0, i64 255
  store float %840, float addrspace(1)* %841, align 4, !tbaa !9
  %842 = getelementptr inbounds float, float addrspace(1)* %0, i64 459
  %843 = load float, float addrspace(1)* %842, align 4, !tbaa !9
  %844 = fmul contract float %843, 5.000000e-01
  %845 = fcmp contract olt float %844, 0.000000e+00
  %846 = select i1 %845, float 0x3FA1111120000000, float %844
  store float %846, float addrspace(1)* %842, align 4, !tbaa !9
  %847 = getelementptr inbounds float, float addrspace(1)* %0, i64 285
  store float %846, float addrspace(1)* %847, align 4, !tbaa !9
  %848 = getelementptr inbounds float, float addrspace(1)* %0, i64 460
  %849 = load float, float addrspace(1)* %848, align 4, !tbaa !9
  %850 = fmul contract float %849, 5.000000e-01
  %851 = fcmp contract olt float %850, 0.000000e+00
  %852 = select i1 %851, float 0x3FA1111120000000, float %850
  store float %852, float addrspace(1)* %848, align 4, !tbaa !9
  %853 = getelementptr inbounds float, float addrspace(1)* %0, i64 315
  store float %852, float addrspace(1)* %853, align 4, !tbaa !9
  %854 = getelementptr inbounds float, float addrspace(1)* %0, i64 461
  %855 = load float, float addrspace(1)* %854, align 4, !tbaa !9
  %856 = fmul contract float %855, 5.000000e-01
  %857 = fcmp contract olt float %856, 0.000000e+00
  %858 = select i1 %857, float 0x3FA1111120000000, float %856
  store float %858, float addrspace(1)* %854, align 4, !tbaa !9
  %859 = getelementptr inbounds float, float addrspace(1)* %0, i64 345
  store float %858, float addrspace(1)* %859, align 4, !tbaa !9
  %860 = getelementptr inbounds float, float addrspace(1)* %0, i64 462
  %861 = load float, float addrspace(1)* %860, align 4, !tbaa !9
  %862 = fmul contract float %861, 5.000000e-01
  %863 = fcmp contract olt float %862, 0.000000e+00
  %864 = select i1 %863, float 0x3FA1111120000000, float %862
  store float %864, float addrspace(1)* %860, align 4, !tbaa !9
  %865 = getelementptr inbounds float, float addrspace(1)* %0, i64 375
  store float %864, float addrspace(1)* %865, align 4, !tbaa !9
  %866 = getelementptr inbounds float, float addrspace(1)* %0, i64 463
  %867 = load float, float addrspace(1)* %866, align 4, !tbaa !9
  %868 = fmul contract float %867, 5.000000e-01
  %869 = fcmp contract olt float %868, 0.000000e+00
  %870 = select i1 %869, float 0x3FA1111120000000, float %868
  store float %870, float addrspace(1)* %866, align 4, !tbaa !9
  %871 = getelementptr inbounds float, float addrspace(1)* %0, i64 405
  store float %870, float addrspace(1)* %871, align 4, !tbaa !9
  %872 = getelementptr inbounds float, float addrspace(1)* %0, i64 464
  %873 = load float, float addrspace(1)* %872, align 4, !tbaa !9
  %874 = fmul contract float %873, 5.000000e-01
  %875 = fcmp contract olt float %874, 0.000000e+00
  %876 = select i1 %875, float 0x3FA1111120000000, float %874
  store float %876, float addrspace(1)* %872, align 4, !tbaa !9
  %877 = getelementptr inbounds float, float addrspace(1)* %0, i64 435
  store float %876, float addrspace(1)* %877, align 4, !tbaa !9
  %878 = getelementptr inbounds float, float addrspace(1)* %0, i64 480
  %879 = load float, float addrspace(1)* %878, align 4, !tbaa !9
  %880 = fmul contract float %879, 5.000000e-01
  %881 = fcmp contract olt float %880, 0.000000e+00
  %882 = select i1 %881, float 0x3FA1111120000000, float %880
  store float %882, float addrspace(1)* %878, align 4, !tbaa !9
  %883 = getelementptr inbounds float, float addrspace(1)* %0, i64 16
  store float %882, float addrspace(1)* %883, align 4, !tbaa !9
  %884 = getelementptr inbounds float, float addrspace(1)* %0, i64 481
  %885 = load float, float addrspace(1)* %884, align 4, !tbaa !9
  %886 = fmul contract float %885, 5.000000e-01
  %887 = fcmp contract olt float %886, 0.000000e+00
  %888 = select i1 %887, float 0x3FA1111120000000, float %886
  store float %888, float addrspace(1)* %884, align 4, !tbaa !9
  %889 = getelementptr inbounds float, float addrspace(1)* %0, i64 46
  store float %888, float addrspace(1)* %889, align 4, !tbaa !9
  %890 = getelementptr inbounds float, float addrspace(1)* %0, i64 482
  %891 = load float, float addrspace(1)* %890, align 4, !tbaa !9
  %892 = fmul contract float %891, 5.000000e-01
  %893 = fcmp contract olt float %892, 0.000000e+00
  %894 = select i1 %893, float 0x3FA1111120000000, float %892
  store float %894, float addrspace(1)* %890, align 4, !tbaa !9
  %895 = getelementptr inbounds float, float addrspace(1)* %0, i64 76
  store float %894, float addrspace(1)* %895, align 4, !tbaa !9
  %896 = getelementptr inbounds float, float addrspace(1)* %0, i64 483
  %897 = load float, float addrspace(1)* %896, align 4, !tbaa !9
  %898 = fmul contract float %897, 5.000000e-01
  %899 = fcmp contract olt float %898, 0.000000e+00
  %900 = select i1 %899, float 0x3FA1111120000000, float %898
  store float %900, float addrspace(1)* %896, align 4, !tbaa !9
  %901 = getelementptr inbounds float, float addrspace(1)* %0, i64 106
  store float %900, float addrspace(1)* %901, align 4, !tbaa !9
  %902 = getelementptr inbounds float, float addrspace(1)* %0, i64 484
  %903 = load float, float addrspace(1)* %902, align 4, !tbaa !9
  %904 = fmul contract float %903, 5.000000e-01
  %905 = fcmp contract olt float %904, 0.000000e+00
  %906 = select i1 %905, float 0x3FA1111120000000, float %904
  store float %906, float addrspace(1)* %902, align 4, !tbaa !9
  %907 = getelementptr inbounds float, float addrspace(1)* %0, i64 136
  store float %906, float addrspace(1)* %907, align 4, !tbaa !9
  %908 = getelementptr inbounds float, float addrspace(1)* %0, i64 485
  %909 = load float, float addrspace(1)* %908, align 4, !tbaa !9
  %910 = fmul contract float %909, 5.000000e-01
  %911 = fcmp contract olt float %910, 0.000000e+00
  %912 = select i1 %911, float 0x3FA1111120000000, float %910
  store float %912, float addrspace(1)* %908, align 4, !tbaa !9
  %913 = getelementptr inbounds float, float addrspace(1)* %0, i64 166
  store float %912, float addrspace(1)* %913, align 4, !tbaa !9
  %914 = getelementptr inbounds float, float addrspace(1)* %0, i64 486
  %915 = load float, float addrspace(1)* %914, align 4, !tbaa !9
  %916 = fmul contract float %915, 5.000000e-01
  %917 = fcmp contract olt float %916, 0.000000e+00
  %918 = select i1 %917, float 0x3FA1111120000000, float %916
  store float %918, float addrspace(1)* %914, align 4, !tbaa !9
  %919 = getelementptr inbounds float, float addrspace(1)* %0, i64 196
  store float %918, float addrspace(1)* %919, align 4, !tbaa !9
  %920 = getelementptr inbounds float, float addrspace(1)* %0, i64 487
  %921 = load float, float addrspace(1)* %920, align 4, !tbaa !9
  %922 = fmul contract float %921, 5.000000e-01
  %923 = fcmp contract olt float %922, 0.000000e+00
  %924 = select i1 %923, float 0x3FA1111120000000, float %922
  store float %924, float addrspace(1)* %920, align 4, !tbaa !9
  %925 = getelementptr inbounds float, float addrspace(1)* %0, i64 226
  store float %924, float addrspace(1)* %925, align 4, !tbaa !9
  %926 = getelementptr inbounds float, float addrspace(1)* %0, i64 488
  %927 = load float, float addrspace(1)* %926, align 4, !tbaa !9
  %928 = fmul contract float %927, 5.000000e-01
  %929 = fcmp contract olt float %928, 0.000000e+00
  %930 = select i1 %929, float 0x3FA1111120000000, float %928
  store float %930, float addrspace(1)* %926, align 4, !tbaa !9
  %931 = getelementptr inbounds float, float addrspace(1)* %0, i64 256
  store float %930, float addrspace(1)* %931, align 4, !tbaa !9
  %932 = getelementptr inbounds float, float addrspace(1)* %0, i64 489
  %933 = load float, float addrspace(1)* %932, align 4, !tbaa !9
  %934 = fmul contract float %933, 5.000000e-01
  %935 = fcmp contract olt float %934, 0.000000e+00
  %936 = select i1 %935, float 0x3FA1111120000000, float %934
  store float %936, float addrspace(1)* %932, align 4, !tbaa !9
  %937 = getelementptr inbounds float, float addrspace(1)* %0, i64 286
  store float %936, float addrspace(1)* %937, align 4, !tbaa !9
  %938 = getelementptr inbounds float, float addrspace(1)* %0, i64 490
  %939 = load float, float addrspace(1)* %938, align 4, !tbaa !9
  %940 = fmul contract float %939, 5.000000e-01
  %941 = fcmp contract olt float %940, 0.000000e+00
  %942 = select i1 %941, float 0x3FA1111120000000, float %940
  store float %942, float addrspace(1)* %938, align 4, !tbaa !9
  %943 = getelementptr inbounds float, float addrspace(1)* %0, i64 316
  store float %942, float addrspace(1)* %943, align 4, !tbaa !9
  %944 = getelementptr inbounds float, float addrspace(1)* %0, i64 491
  %945 = load float, float addrspace(1)* %944, align 4, !tbaa !9
  %946 = fmul contract float %945, 5.000000e-01
  %947 = fcmp contract olt float %946, 0.000000e+00
  %948 = select i1 %947, float 0x3FA1111120000000, float %946
  store float %948, float addrspace(1)* %944, align 4, !tbaa !9
  %949 = getelementptr inbounds float, float addrspace(1)* %0, i64 346
  store float %948, float addrspace(1)* %949, align 4, !tbaa !9
  %950 = getelementptr inbounds float, float addrspace(1)* %0, i64 492
  %951 = load float, float addrspace(1)* %950, align 4, !tbaa !9
  %952 = fmul contract float %951, 5.000000e-01
  %953 = fcmp contract olt float %952, 0.000000e+00
  %954 = select i1 %953, float 0x3FA1111120000000, float %952
  store float %954, float addrspace(1)* %950, align 4, !tbaa !9
  %955 = getelementptr inbounds float, float addrspace(1)* %0, i64 376
  store float %954, float addrspace(1)* %955, align 4, !tbaa !9
  %956 = getelementptr inbounds float, float addrspace(1)* %0, i64 493
  %957 = load float, float addrspace(1)* %956, align 4, !tbaa !9
  %958 = fmul contract float %957, 5.000000e-01
  %959 = fcmp contract olt float %958, 0.000000e+00
  %960 = select i1 %959, float 0x3FA1111120000000, float %958
  store float %960, float addrspace(1)* %956, align 4, !tbaa !9
  %961 = getelementptr inbounds float, float addrspace(1)* %0, i64 406
  store float %960, float addrspace(1)* %961, align 4, !tbaa !9
  %962 = getelementptr inbounds float, float addrspace(1)* %0, i64 494
  %963 = load float, float addrspace(1)* %962, align 4, !tbaa !9
  %964 = fmul contract float %963, 5.000000e-01
  %965 = fcmp contract olt float %964, 0.000000e+00
  %966 = select i1 %965, float 0x3FA1111120000000, float %964
  store float %966, float addrspace(1)* %962, align 4, !tbaa !9
  %967 = getelementptr inbounds float, float addrspace(1)* %0, i64 436
  store float %966, float addrspace(1)* %967, align 4, !tbaa !9
  %968 = getelementptr inbounds float, float addrspace(1)* %0, i64 495
  %969 = load float, float addrspace(1)* %968, align 4, !tbaa !9
  %970 = fmul contract float %969, 5.000000e-01
  %971 = fcmp contract olt float %970, 0.000000e+00
  %972 = select i1 %971, float 0x3FA1111120000000, float %970
  store float %972, float addrspace(1)* %968, align 4, !tbaa !9
  %973 = getelementptr inbounds float, float addrspace(1)* %0, i64 466
  store float %972, float addrspace(1)* %973, align 4, !tbaa !9
  %974 = getelementptr inbounds float, float addrspace(1)* %0, i64 510
  %975 = load float, float addrspace(1)* %974, align 4, !tbaa !9
  %976 = fmul contract float %975, 5.000000e-01
  %977 = fcmp contract olt float %976, 0.000000e+00
  %978 = select i1 %977, float 0x3FA1111120000000, float %976
  store float %978, float addrspace(1)* %974, align 4, !tbaa !9
  %979 = getelementptr inbounds float, float addrspace(1)* %0, i64 17
  store float %978, float addrspace(1)* %979, align 4, !tbaa !9
  %980 = getelementptr inbounds float, float addrspace(1)* %0, i64 511
  %981 = load float, float addrspace(1)* %980, align 4, !tbaa !9
  %982 = fmul contract float %981, 5.000000e-01
  %983 = fcmp contract olt float %982, 0.000000e+00
  %984 = select i1 %983, float 0x3FA1111120000000, float %982
  store float %984, float addrspace(1)* %980, align 4, !tbaa !9
  %985 = getelementptr inbounds float, float addrspace(1)* %0, i64 47
  store float %984, float addrspace(1)* %985, align 4, !tbaa !9
  %986 = getelementptr inbounds float, float addrspace(1)* %0, i64 512
  %987 = load float, float addrspace(1)* %986, align 4, !tbaa !9
  %988 = fmul contract float %987, 5.000000e-01
  %989 = fcmp contract olt float %988, 0.000000e+00
  %990 = select i1 %989, float 0x3FA1111120000000, float %988
  store float %990, float addrspace(1)* %986, align 4, !tbaa !9
  %991 = getelementptr inbounds float, float addrspace(1)* %0, i64 77
  store float %990, float addrspace(1)* %991, align 4, !tbaa !9
  %992 = getelementptr inbounds float, float addrspace(1)* %0, i64 513
  %993 = load float, float addrspace(1)* %992, align 4, !tbaa !9
  %994 = fmul contract float %993, 5.000000e-01
  %995 = fcmp contract olt float %994, 0.000000e+00
  %996 = select i1 %995, float 0x3FA1111120000000, float %994
  store float %996, float addrspace(1)* %992, align 4, !tbaa !9
  %997 = getelementptr inbounds float, float addrspace(1)* %0, i64 107
  store float %996, float addrspace(1)* %997, align 4, !tbaa !9
  %998 = getelementptr inbounds float, float addrspace(1)* %0, i64 514
  %999 = load float, float addrspace(1)* %998, align 4, !tbaa !9
  %1000 = fmul contract float %999, 5.000000e-01
  %1001 = fcmp contract olt float %1000, 0.000000e+00
  %1002 = select i1 %1001, float 0x3FA1111120000000, float %1000
  store float %1002, float addrspace(1)* %998, align 4, !tbaa !9
  %1003 = getelementptr inbounds float, float addrspace(1)* %0, i64 137
  store float %1002, float addrspace(1)* %1003, align 4, !tbaa !9
  %1004 = getelementptr inbounds float, float addrspace(1)* %0, i64 515
  %1005 = load float, float addrspace(1)* %1004, align 4, !tbaa !9
  %1006 = fmul contract float %1005, 5.000000e-01
  %1007 = fcmp contract olt float %1006, 0.000000e+00
  %1008 = select i1 %1007, float 0x3FA1111120000000, float %1006
  store float %1008, float addrspace(1)* %1004, align 4, !tbaa !9
  %1009 = getelementptr inbounds float, float addrspace(1)* %0, i64 167
  store float %1008, float addrspace(1)* %1009, align 4, !tbaa !9
  %1010 = getelementptr inbounds float, float addrspace(1)* %0, i64 516
  %1011 = load float, float addrspace(1)* %1010, align 4, !tbaa !9
  %1012 = fmul contract float %1011, 5.000000e-01
  %1013 = fcmp contract olt float %1012, 0.000000e+00
  %1014 = select i1 %1013, float 0x3FA1111120000000, float %1012
  store float %1014, float addrspace(1)* %1010, align 4, !tbaa !9
  %1015 = getelementptr inbounds float, float addrspace(1)* %0, i64 197
  store float %1014, float addrspace(1)* %1015, align 4, !tbaa !9
  %1016 = getelementptr inbounds float, float addrspace(1)* %0, i64 517
  %1017 = load float, float addrspace(1)* %1016, align 4, !tbaa !9
  %1018 = fmul contract float %1017, 5.000000e-01
  %1019 = fcmp contract olt float %1018, 0.000000e+00
  %1020 = select i1 %1019, float 0x3FA1111120000000, float %1018
  store float %1020, float addrspace(1)* %1016, align 4, !tbaa !9
  %1021 = getelementptr inbounds float, float addrspace(1)* %0, i64 227
  store float %1020, float addrspace(1)* %1021, align 4, !tbaa !9
  %1022 = getelementptr inbounds float, float addrspace(1)* %0, i64 518
  %1023 = load float, float addrspace(1)* %1022, align 4, !tbaa !9
  %1024 = fmul contract float %1023, 5.000000e-01
  %1025 = fcmp contract olt float %1024, 0.000000e+00
  %1026 = select i1 %1025, float 0x3FA1111120000000, float %1024
  store float %1026, float addrspace(1)* %1022, align 4, !tbaa !9
  %1027 = getelementptr inbounds float, float addrspace(1)* %0, i64 257
  store float %1026, float addrspace(1)* %1027, align 4, !tbaa !9
  %1028 = getelementptr inbounds float, float addrspace(1)* %0, i64 519
  %1029 = load float, float addrspace(1)* %1028, align 4, !tbaa !9
  %1030 = fmul contract float %1029, 5.000000e-01
  %1031 = fcmp contract olt float %1030, 0.000000e+00
  %1032 = select i1 %1031, float 0x3FA1111120000000, float %1030
  store float %1032, float addrspace(1)* %1028, align 4, !tbaa !9
  %1033 = getelementptr inbounds float, float addrspace(1)* %0, i64 287
  store float %1032, float addrspace(1)* %1033, align 4, !tbaa !9
  %1034 = getelementptr inbounds float, float addrspace(1)* %0, i64 520
  %1035 = load float, float addrspace(1)* %1034, align 4, !tbaa !9
  %1036 = fmul contract float %1035, 5.000000e-01
  %1037 = fcmp contract olt float %1036, 0.000000e+00
  %1038 = select i1 %1037, float 0x3FA1111120000000, float %1036
  store float %1038, float addrspace(1)* %1034, align 4, !tbaa !9
  %1039 = getelementptr inbounds float, float addrspace(1)* %0, i64 317
  store float %1038, float addrspace(1)* %1039, align 4, !tbaa !9
  %1040 = getelementptr inbounds float, float addrspace(1)* %0, i64 521
  %1041 = load float, float addrspace(1)* %1040, align 4, !tbaa !9
  %1042 = fmul contract float %1041, 5.000000e-01
  %1043 = fcmp contract olt float %1042, 0.000000e+00
  %1044 = select i1 %1043, float 0x3FA1111120000000, float %1042
  store float %1044, float addrspace(1)* %1040, align 4, !tbaa !9
  %1045 = getelementptr inbounds float, float addrspace(1)* %0, i64 347
  store float %1044, float addrspace(1)* %1045, align 4, !tbaa !9
  %1046 = getelementptr inbounds float, float addrspace(1)* %0, i64 522
  %1047 = load float, float addrspace(1)* %1046, align 4, !tbaa !9
  %1048 = fmul contract float %1047, 5.000000e-01
  %1049 = fcmp contract olt float %1048, 0.000000e+00
  %1050 = select i1 %1049, float 0x3FA1111120000000, float %1048
  store float %1050, float addrspace(1)* %1046, align 4, !tbaa !9
  %1051 = getelementptr inbounds float, float addrspace(1)* %0, i64 377
  store float %1050, float addrspace(1)* %1051, align 4, !tbaa !9
  %1052 = getelementptr inbounds float, float addrspace(1)* %0, i64 523
  %1053 = load float, float addrspace(1)* %1052, align 4, !tbaa !9
  %1054 = fmul contract float %1053, 5.000000e-01
  %1055 = fcmp contract olt float %1054, 0.000000e+00
  %1056 = select i1 %1055, float 0x3FA1111120000000, float %1054
  store float %1056, float addrspace(1)* %1052, align 4, !tbaa !9
  %1057 = getelementptr inbounds float, float addrspace(1)* %0, i64 407
  store float %1056, float addrspace(1)* %1057, align 4, !tbaa !9
  %1058 = getelementptr inbounds float, float addrspace(1)* %0, i64 524
  %1059 = load float, float addrspace(1)* %1058, align 4, !tbaa !9
  %1060 = fmul contract float %1059, 5.000000e-01
  %1061 = fcmp contract olt float %1060, 0.000000e+00
  %1062 = select i1 %1061, float 0x3FA1111120000000, float %1060
  store float %1062, float addrspace(1)* %1058, align 4, !tbaa !9
  %1063 = getelementptr inbounds float, float addrspace(1)* %0, i64 437
  store float %1062, float addrspace(1)* %1063, align 4, !tbaa !9
  %1064 = getelementptr inbounds float, float addrspace(1)* %0, i64 525
  %1065 = load float, float addrspace(1)* %1064, align 4, !tbaa !9
  %1066 = fmul contract float %1065, 5.000000e-01
  %1067 = fcmp contract olt float %1066, 0.000000e+00
  %1068 = select i1 %1067, float 0x3FA1111120000000, float %1066
  store float %1068, float addrspace(1)* %1064, align 4, !tbaa !9
  %1069 = getelementptr inbounds float, float addrspace(1)* %0, i64 467
  store float %1068, float addrspace(1)* %1069, align 4, !tbaa !9
  %1070 = getelementptr inbounds float, float addrspace(1)* %0, i64 526
  %1071 = load float, float addrspace(1)* %1070, align 4, !tbaa !9
  %1072 = fmul contract float %1071, 5.000000e-01
  %1073 = fcmp contract olt float %1072, 0.000000e+00
  %1074 = select i1 %1073, float 0x3FA1111120000000, float %1072
  store float %1074, float addrspace(1)* %1070, align 4, !tbaa !9
  %1075 = getelementptr inbounds float, float addrspace(1)* %0, i64 497
  store float %1074, float addrspace(1)* %1075, align 4, !tbaa !9
  %1076 = getelementptr inbounds float, float addrspace(1)* %0, i64 540
  %1077 = load float, float addrspace(1)* %1076, align 4, !tbaa !9
  %1078 = fmul contract float %1077, 5.000000e-01
  %1079 = fcmp contract olt float %1078, 0.000000e+00
  %1080 = select i1 %1079, float 0x3FA1111120000000, float %1078
  store float %1080, float addrspace(1)* %1076, align 4, !tbaa !9
  %1081 = getelementptr inbounds float, float addrspace(1)* %0, i64 18
  store float %1080, float addrspace(1)* %1081, align 4, !tbaa !9
  %1082 = getelementptr inbounds float, float addrspace(1)* %0, i64 541
  %1083 = load float, float addrspace(1)* %1082, align 4, !tbaa !9
  %1084 = fmul contract float %1083, 5.000000e-01
  %1085 = fcmp contract olt float %1084, 0.000000e+00
  %1086 = select i1 %1085, float 0x3FA1111120000000, float %1084
  store float %1086, float addrspace(1)* %1082, align 4, !tbaa !9
  %1087 = getelementptr inbounds float, float addrspace(1)* %0, i64 48
  store float %1086, float addrspace(1)* %1087, align 4, !tbaa !9
  %1088 = getelementptr inbounds float, float addrspace(1)* %0, i64 542
  %1089 = load float, float addrspace(1)* %1088, align 4, !tbaa !9
  %1090 = fmul contract float %1089, 5.000000e-01
  %1091 = fcmp contract olt float %1090, 0.000000e+00
  %1092 = select i1 %1091, float 0x3FA1111120000000, float %1090
  store float %1092, float addrspace(1)* %1088, align 4, !tbaa !9
  %1093 = getelementptr inbounds float, float addrspace(1)* %0, i64 78
  store float %1092, float addrspace(1)* %1093, align 4, !tbaa !9
  %1094 = getelementptr inbounds float, float addrspace(1)* %0, i64 543
  %1095 = load float, float addrspace(1)* %1094, align 4, !tbaa !9
  %1096 = fmul contract float %1095, 5.000000e-01
  %1097 = fcmp contract olt float %1096, 0.000000e+00
  %1098 = select i1 %1097, float 0x3FA1111120000000, float %1096
  store float %1098, float addrspace(1)* %1094, align 4, !tbaa !9
  %1099 = getelementptr inbounds float, float addrspace(1)* %0, i64 108
  store float %1098, float addrspace(1)* %1099, align 4, !tbaa !9
  %1100 = getelementptr inbounds float, float addrspace(1)* %0, i64 544
  %1101 = load float, float addrspace(1)* %1100, align 4, !tbaa !9
  %1102 = fmul contract float %1101, 5.000000e-01
  %1103 = fcmp contract olt float %1102, 0.000000e+00
  %1104 = select i1 %1103, float 0x3FA1111120000000, float %1102
  store float %1104, float addrspace(1)* %1100, align 4, !tbaa !9
  %1105 = getelementptr inbounds float, float addrspace(1)* %0, i64 138
  store float %1104, float addrspace(1)* %1105, align 4, !tbaa !9
  %1106 = getelementptr inbounds float, float addrspace(1)* %0, i64 545
  %1107 = load float, float addrspace(1)* %1106, align 4, !tbaa !9
  %1108 = fmul contract float %1107, 5.000000e-01
  %1109 = fcmp contract olt float %1108, 0.000000e+00
  %1110 = select i1 %1109, float 0x3FA1111120000000, float %1108
  store float %1110, float addrspace(1)* %1106, align 4, !tbaa !9
  %1111 = getelementptr inbounds float, float addrspace(1)* %0, i64 168
  store float %1110, float addrspace(1)* %1111, align 4, !tbaa !9
  %1112 = getelementptr inbounds float, float addrspace(1)* %0, i64 546
  %1113 = load float, float addrspace(1)* %1112, align 4, !tbaa !9
  %1114 = fmul contract float %1113, 5.000000e-01
  %1115 = fcmp contract olt float %1114, 0.000000e+00
  %1116 = select i1 %1115, float 0x3FA1111120000000, float %1114
  store float %1116, float addrspace(1)* %1112, align 4, !tbaa !9
  %1117 = getelementptr inbounds float, float addrspace(1)* %0, i64 198
  store float %1116, float addrspace(1)* %1117, align 4, !tbaa !9
  %1118 = getelementptr inbounds float, float addrspace(1)* %0, i64 547
  %1119 = load float, float addrspace(1)* %1118, align 4, !tbaa !9
  %1120 = fmul contract float %1119, 5.000000e-01
  %1121 = fcmp contract olt float %1120, 0.000000e+00
  %1122 = select i1 %1121, float 0x3FA1111120000000, float %1120
  store float %1122, float addrspace(1)* %1118, align 4, !tbaa !9
  %1123 = getelementptr inbounds float, float addrspace(1)* %0, i64 228
  store float %1122, float addrspace(1)* %1123, align 4, !tbaa !9
  %1124 = getelementptr inbounds float, float addrspace(1)* %0, i64 548
  %1125 = load float, float addrspace(1)* %1124, align 4, !tbaa !9
  %1126 = fmul contract float %1125, 5.000000e-01
  %1127 = fcmp contract olt float %1126, 0.000000e+00
  %1128 = select i1 %1127, float 0x3FA1111120000000, float %1126
  store float %1128, float addrspace(1)* %1124, align 4, !tbaa !9
  %1129 = getelementptr inbounds float, float addrspace(1)* %0, i64 258
  store float %1128, float addrspace(1)* %1129, align 4, !tbaa !9
  %1130 = getelementptr inbounds float, float addrspace(1)* %0, i64 549
  %1131 = load float, float addrspace(1)* %1130, align 4, !tbaa !9
  %1132 = fmul contract float %1131, 5.000000e-01
  %1133 = fcmp contract olt float %1132, 0.000000e+00
  %1134 = select i1 %1133, float 0x3FA1111120000000, float %1132
  store float %1134, float addrspace(1)* %1130, align 4, !tbaa !9
  %1135 = getelementptr inbounds float, float addrspace(1)* %0, i64 288
  store float %1134, float addrspace(1)* %1135, align 4, !tbaa !9
  %1136 = getelementptr inbounds float, float addrspace(1)* %0, i64 550
  %1137 = load float, float addrspace(1)* %1136, align 4, !tbaa !9
  %1138 = fmul contract float %1137, 5.000000e-01
  %1139 = fcmp contract olt float %1138, 0.000000e+00
  %1140 = select i1 %1139, float 0x3FA1111120000000, float %1138
  store float %1140, float addrspace(1)* %1136, align 4, !tbaa !9
  %1141 = getelementptr inbounds float, float addrspace(1)* %0, i64 318
  store float %1140, float addrspace(1)* %1141, align 4, !tbaa !9
  %1142 = getelementptr inbounds float, float addrspace(1)* %0, i64 551
  %1143 = load float, float addrspace(1)* %1142, align 4, !tbaa !9
  %1144 = fmul contract float %1143, 5.000000e-01
  %1145 = fcmp contract olt float %1144, 0.000000e+00
  %1146 = select i1 %1145, float 0x3FA1111120000000, float %1144
  store float %1146, float addrspace(1)* %1142, align 4, !tbaa !9
  %1147 = getelementptr inbounds float, float addrspace(1)* %0, i64 348
  store float %1146, float addrspace(1)* %1147, align 4, !tbaa !9
  %1148 = getelementptr inbounds float, float addrspace(1)* %0, i64 552
  %1149 = load float, float addrspace(1)* %1148, align 4, !tbaa !9
  %1150 = fmul contract float %1149, 5.000000e-01
  %1151 = fcmp contract olt float %1150, 0.000000e+00
  %1152 = select i1 %1151, float 0x3FA1111120000000, float %1150
  store float %1152, float addrspace(1)* %1148, align 4, !tbaa !9
  %1153 = getelementptr inbounds float, float addrspace(1)* %0, i64 378
  store float %1152, float addrspace(1)* %1153, align 4, !tbaa !9
  %1154 = getelementptr inbounds float, float addrspace(1)* %0, i64 553
  %1155 = load float, float addrspace(1)* %1154, align 4, !tbaa !9
  %1156 = fmul contract float %1155, 5.000000e-01
  %1157 = fcmp contract olt float %1156, 0.000000e+00
  %1158 = select i1 %1157, float 0x3FA1111120000000, float %1156
  store float %1158, float addrspace(1)* %1154, align 4, !tbaa !9
  %1159 = getelementptr inbounds float, float addrspace(1)* %0, i64 408
  store float %1158, float addrspace(1)* %1159, align 4, !tbaa !9
  %1160 = getelementptr inbounds float, float addrspace(1)* %0, i64 554
  %1161 = load float, float addrspace(1)* %1160, align 4, !tbaa !9
  %1162 = fmul contract float %1161, 5.000000e-01
  %1163 = fcmp contract olt float %1162, 0.000000e+00
  %1164 = select i1 %1163, float 0x3FA1111120000000, float %1162
  store float %1164, float addrspace(1)* %1160, align 4, !tbaa !9
  %1165 = getelementptr inbounds float, float addrspace(1)* %0, i64 438
  store float %1164, float addrspace(1)* %1165, align 4, !tbaa !9
  %1166 = getelementptr inbounds float, float addrspace(1)* %0, i64 555
  %1167 = load float, float addrspace(1)* %1166, align 4, !tbaa !9
  %1168 = fmul contract float %1167, 5.000000e-01
  %1169 = fcmp contract olt float %1168, 0.000000e+00
  %1170 = select i1 %1169, float 0x3FA1111120000000, float %1168
  store float %1170, float addrspace(1)* %1166, align 4, !tbaa !9
  %1171 = getelementptr inbounds float, float addrspace(1)* %0, i64 468
  store float %1170, float addrspace(1)* %1171, align 4, !tbaa !9
  %1172 = getelementptr inbounds float, float addrspace(1)* %0, i64 556
  %1173 = load float, float addrspace(1)* %1172, align 4, !tbaa !9
  %1174 = fmul contract float %1173, 5.000000e-01
  %1175 = fcmp contract olt float %1174, 0.000000e+00
  %1176 = select i1 %1175, float 0x3FA1111120000000, float %1174
  store float %1176, float addrspace(1)* %1172, align 4, !tbaa !9
  %1177 = getelementptr inbounds float, float addrspace(1)* %0, i64 498
  store float %1176, float addrspace(1)* %1177, align 4, !tbaa !9
  %1178 = getelementptr inbounds float, float addrspace(1)* %0, i64 557
  %1179 = load float, float addrspace(1)* %1178, align 4, !tbaa !9
  %1180 = fmul contract float %1179, 5.000000e-01
  %1181 = fcmp contract olt float %1180, 0.000000e+00
  %1182 = select i1 %1181, float 0x3FA1111120000000, float %1180
  store float %1182, float addrspace(1)* %1178, align 4, !tbaa !9
  %1183 = getelementptr inbounds float, float addrspace(1)* %0, i64 528
  store float %1182, float addrspace(1)* %1183, align 4, !tbaa !9
  %1184 = getelementptr inbounds float, float addrspace(1)* %0, i64 570
  %1185 = load float, float addrspace(1)* %1184, align 4, !tbaa !9
  %1186 = fmul contract float %1185, 5.000000e-01
  %1187 = fcmp contract olt float %1186, 0.000000e+00
  %1188 = select i1 %1187, float 0x3FA1111120000000, float %1186
  store float %1188, float addrspace(1)* %1184, align 4, !tbaa !9
  %1189 = getelementptr inbounds float, float addrspace(1)* %0, i64 19
  store float %1188, float addrspace(1)* %1189, align 4, !tbaa !9
  %1190 = getelementptr inbounds float, float addrspace(1)* %0, i64 571
  %1191 = load float, float addrspace(1)* %1190, align 4, !tbaa !9
  %1192 = fmul contract float %1191, 5.000000e-01
  %1193 = fcmp contract olt float %1192, 0.000000e+00
  %1194 = select i1 %1193, float 0x3FA1111120000000, float %1192
  store float %1194, float addrspace(1)* %1190, align 4, !tbaa !9
  %1195 = getelementptr inbounds float, float addrspace(1)* %0, i64 49
  store float %1194, float addrspace(1)* %1195, align 4, !tbaa !9
  %1196 = getelementptr inbounds float, float addrspace(1)* %0, i64 572
  %1197 = load float, float addrspace(1)* %1196, align 4, !tbaa !9
  %1198 = fmul contract float %1197, 5.000000e-01
  %1199 = fcmp contract olt float %1198, 0.000000e+00
  %1200 = select i1 %1199, float 0x3FA1111120000000, float %1198
  store float %1200, float addrspace(1)* %1196, align 4, !tbaa !9
  %1201 = getelementptr inbounds float, float addrspace(1)* %0, i64 79
  store float %1200, float addrspace(1)* %1201, align 4, !tbaa !9
  %1202 = getelementptr inbounds float, float addrspace(1)* %0, i64 573
  %1203 = load float, float addrspace(1)* %1202, align 4, !tbaa !9
  %1204 = fmul contract float %1203, 5.000000e-01
  %1205 = fcmp contract olt float %1204, 0.000000e+00
  %1206 = select i1 %1205, float 0x3FA1111120000000, float %1204
  store float %1206, float addrspace(1)* %1202, align 4, !tbaa !9
  %1207 = getelementptr inbounds float, float addrspace(1)* %0, i64 109
  store float %1206, float addrspace(1)* %1207, align 4, !tbaa !9
  %1208 = getelementptr inbounds float, float addrspace(1)* %0, i64 574
  %1209 = load float, float addrspace(1)* %1208, align 4, !tbaa !9
  %1210 = fmul contract float %1209, 5.000000e-01
  %1211 = fcmp contract olt float %1210, 0.000000e+00
  %1212 = select i1 %1211, float 0x3FA1111120000000, float %1210
  store float %1212, float addrspace(1)* %1208, align 4, !tbaa !9
  %1213 = getelementptr inbounds float, float addrspace(1)* %0, i64 139
  store float %1212, float addrspace(1)* %1213, align 4, !tbaa !9
  %1214 = getelementptr inbounds float, float addrspace(1)* %0, i64 575
  %1215 = load float, float addrspace(1)* %1214, align 4, !tbaa !9
  %1216 = fmul contract float %1215, 5.000000e-01
  %1217 = fcmp contract olt float %1216, 0.000000e+00
  %1218 = select i1 %1217, float 0x3FA1111120000000, float %1216
  store float %1218, float addrspace(1)* %1214, align 4, !tbaa !9
  %1219 = getelementptr inbounds float, float addrspace(1)* %0, i64 169
  store float %1218, float addrspace(1)* %1219, align 4, !tbaa !9
  %1220 = getelementptr inbounds float, float addrspace(1)* %0, i64 576
  %1221 = load float, float addrspace(1)* %1220, align 4, !tbaa !9
  %1222 = fmul contract float %1221, 5.000000e-01
  %1223 = fcmp contract olt float %1222, 0.000000e+00
  %1224 = select i1 %1223, float 0x3FA1111120000000, float %1222
  store float %1224, float addrspace(1)* %1220, align 4, !tbaa !9
  %1225 = getelementptr inbounds float, float addrspace(1)* %0, i64 199
  store float %1224, float addrspace(1)* %1225, align 4, !tbaa !9
  %1226 = getelementptr inbounds float, float addrspace(1)* %0, i64 577
  %1227 = load float, float addrspace(1)* %1226, align 4, !tbaa !9
  %1228 = fmul contract float %1227, 5.000000e-01
  %1229 = fcmp contract olt float %1228, 0.000000e+00
  %1230 = select i1 %1229, float 0x3FA1111120000000, float %1228
  store float %1230, float addrspace(1)* %1226, align 4, !tbaa !9
  %1231 = getelementptr inbounds float, float addrspace(1)* %0, i64 229
  store float %1230, float addrspace(1)* %1231, align 4, !tbaa !9
  %1232 = getelementptr inbounds float, float addrspace(1)* %0, i64 578
  %1233 = load float, float addrspace(1)* %1232, align 4, !tbaa !9
  %1234 = fmul contract float %1233, 5.000000e-01
  %1235 = fcmp contract olt float %1234, 0.000000e+00
  %1236 = select i1 %1235, float 0x3FA1111120000000, float %1234
  store float %1236, float addrspace(1)* %1232, align 4, !tbaa !9
  %1237 = getelementptr inbounds float, float addrspace(1)* %0, i64 259
  store float %1236, float addrspace(1)* %1237, align 4, !tbaa !9
  %1238 = getelementptr inbounds float, float addrspace(1)* %0, i64 579
  %1239 = load float, float addrspace(1)* %1238, align 4, !tbaa !9
  %1240 = fmul contract float %1239, 5.000000e-01
  %1241 = fcmp contract olt float %1240, 0.000000e+00
  %1242 = select i1 %1241, float 0x3FA1111120000000, float %1240
  store float %1242, float addrspace(1)* %1238, align 4, !tbaa !9
  %1243 = getelementptr inbounds float, float addrspace(1)* %0, i64 289
  store float %1242, float addrspace(1)* %1243, align 4, !tbaa !9
  %1244 = getelementptr inbounds float, float addrspace(1)* %0, i64 580
  %1245 = load float, float addrspace(1)* %1244, align 4, !tbaa !9
  %1246 = fmul contract float %1245, 5.000000e-01
  %1247 = fcmp contract olt float %1246, 0.000000e+00
  %1248 = select i1 %1247, float 0x3FA1111120000000, float %1246
  store float %1248, float addrspace(1)* %1244, align 4, !tbaa !9
  %1249 = getelementptr inbounds float, float addrspace(1)* %0, i64 319
  store float %1248, float addrspace(1)* %1249, align 4, !tbaa !9
  %1250 = getelementptr inbounds float, float addrspace(1)* %0, i64 581
  %1251 = load float, float addrspace(1)* %1250, align 4, !tbaa !9
  %1252 = fmul contract float %1251, 5.000000e-01
  %1253 = fcmp contract olt float %1252, 0.000000e+00
  %1254 = select i1 %1253, float 0x3FA1111120000000, float %1252
  store float %1254, float addrspace(1)* %1250, align 4, !tbaa !9
  %1255 = getelementptr inbounds float, float addrspace(1)* %0, i64 349
  store float %1254, float addrspace(1)* %1255, align 4, !tbaa !9
  %1256 = getelementptr inbounds float, float addrspace(1)* %0, i64 582
  %1257 = load float, float addrspace(1)* %1256, align 4, !tbaa !9
  %1258 = fmul contract float %1257, 5.000000e-01
  %1259 = fcmp contract olt float %1258, 0.000000e+00
  %1260 = select i1 %1259, float 0x3FA1111120000000, float %1258
  store float %1260, float addrspace(1)* %1256, align 4, !tbaa !9
  %1261 = getelementptr inbounds float, float addrspace(1)* %0, i64 379
  store float %1260, float addrspace(1)* %1261, align 4, !tbaa !9
  %1262 = getelementptr inbounds float, float addrspace(1)* %0, i64 583
  %1263 = load float, float addrspace(1)* %1262, align 4, !tbaa !9
  %1264 = fmul contract float %1263, 5.000000e-01
  %1265 = fcmp contract olt float %1264, 0.000000e+00
  %1266 = select i1 %1265, float 0x3FA1111120000000, float %1264
  store float %1266, float addrspace(1)* %1262, align 4, !tbaa !9
  %1267 = getelementptr inbounds float, float addrspace(1)* %0, i64 409
  store float %1266, float addrspace(1)* %1267, align 4, !tbaa !9
  %1268 = getelementptr inbounds float, float addrspace(1)* %0, i64 584
  %1269 = load float, float addrspace(1)* %1268, align 4, !tbaa !9
  %1270 = fmul contract float %1269, 5.000000e-01
  %1271 = fcmp contract olt float %1270, 0.000000e+00
  %1272 = select i1 %1271, float 0x3FA1111120000000, float %1270
  store float %1272, float addrspace(1)* %1268, align 4, !tbaa !9
  %1273 = getelementptr inbounds float, float addrspace(1)* %0, i64 439
  store float %1272, float addrspace(1)* %1273, align 4, !tbaa !9
  %1274 = getelementptr inbounds float, float addrspace(1)* %0, i64 585
  %1275 = load float, float addrspace(1)* %1274, align 4, !tbaa !9
  %1276 = fmul contract float %1275, 5.000000e-01
  %1277 = fcmp contract olt float %1276, 0.000000e+00
  %1278 = select i1 %1277, float 0x3FA1111120000000, float %1276
  store float %1278, float addrspace(1)* %1274, align 4, !tbaa !9
  %1279 = getelementptr inbounds float, float addrspace(1)* %0, i64 469
  store float %1278, float addrspace(1)* %1279, align 4, !tbaa !9
  %1280 = getelementptr inbounds float, float addrspace(1)* %0, i64 586
  %1281 = load float, float addrspace(1)* %1280, align 4, !tbaa !9
  %1282 = fmul contract float %1281, 5.000000e-01
  %1283 = fcmp contract olt float %1282, 0.000000e+00
  %1284 = select i1 %1283, float 0x3FA1111120000000, float %1282
  store float %1284, float addrspace(1)* %1280, align 4, !tbaa !9
  %1285 = getelementptr inbounds float, float addrspace(1)* %0, i64 499
  store float %1284, float addrspace(1)* %1285, align 4, !tbaa !9
  %1286 = getelementptr inbounds float, float addrspace(1)* %0, i64 587
  %1287 = load float, float addrspace(1)* %1286, align 4, !tbaa !9
  %1288 = fmul contract float %1287, 5.000000e-01
  %1289 = fcmp contract olt float %1288, 0.000000e+00
  %1290 = select i1 %1289, float 0x3FA1111120000000, float %1288
  store float %1290, float addrspace(1)* %1286, align 4, !tbaa !9
  %1291 = getelementptr inbounds float, float addrspace(1)* %0, i64 529
  store float %1290, float addrspace(1)* %1291, align 4, !tbaa !9
  %1292 = getelementptr inbounds float, float addrspace(1)* %0, i64 588
  %1293 = load float, float addrspace(1)* %1292, align 4, !tbaa !9
  %1294 = fmul contract float %1293, 5.000000e-01
  %1295 = fcmp contract olt float %1294, 0.000000e+00
  %1296 = select i1 %1295, float 0x3FA1111120000000, float %1294
  store float %1296, float addrspace(1)* %1292, align 4, !tbaa !9
  %1297 = getelementptr inbounds float, float addrspace(1)* %0, i64 559
  store float %1296, float addrspace(1)* %1297, align 4, !tbaa !9
  %1298 = getelementptr inbounds float, float addrspace(1)* %0, i64 600
  %1299 = load float, float addrspace(1)* %1298, align 4, !tbaa !9
  %1300 = fmul contract float %1299, 5.000000e-01
  %1301 = fcmp contract olt float %1300, 0.000000e+00
  %1302 = select i1 %1301, float 0x3FA1111120000000, float %1300
  store float %1302, float addrspace(1)* %1298, align 4, !tbaa !9
  %1303 = getelementptr inbounds float, float addrspace(1)* %0, i64 20
  store float %1302, float addrspace(1)* %1303, align 4, !tbaa !9
  %1304 = getelementptr inbounds float, float addrspace(1)* %0, i64 601
  %1305 = load float, float addrspace(1)* %1304, align 4, !tbaa !9
  %1306 = fmul contract float %1305, 5.000000e-01
  %1307 = fcmp contract olt float %1306, 0.000000e+00
  %1308 = select i1 %1307, float 0x3FA1111120000000, float %1306
  store float %1308, float addrspace(1)* %1304, align 4, !tbaa !9
  %1309 = getelementptr inbounds float, float addrspace(1)* %0, i64 50
  store float %1308, float addrspace(1)* %1309, align 4, !tbaa !9
  %1310 = getelementptr inbounds float, float addrspace(1)* %0, i64 602
  %1311 = load float, float addrspace(1)* %1310, align 4, !tbaa !9
  %1312 = fmul contract float %1311, 5.000000e-01
  %1313 = fcmp contract olt float %1312, 0.000000e+00
  %1314 = select i1 %1313, float 0x3FA1111120000000, float %1312
  store float %1314, float addrspace(1)* %1310, align 4, !tbaa !9
  %1315 = getelementptr inbounds float, float addrspace(1)* %0, i64 80
  store float %1314, float addrspace(1)* %1315, align 4, !tbaa !9
  %1316 = getelementptr inbounds float, float addrspace(1)* %0, i64 603
  %1317 = load float, float addrspace(1)* %1316, align 4, !tbaa !9
  %1318 = fmul contract float %1317, 5.000000e-01
  %1319 = fcmp contract olt float %1318, 0.000000e+00
  %1320 = select i1 %1319, float 0x3FA1111120000000, float %1318
  store float %1320, float addrspace(1)* %1316, align 4, !tbaa !9
  %1321 = getelementptr inbounds float, float addrspace(1)* %0, i64 110
  store float %1320, float addrspace(1)* %1321, align 4, !tbaa !9
  %1322 = getelementptr inbounds float, float addrspace(1)* %0, i64 604
  %1323 = load float, float addrspace(1)* %1322, align 4, !tbaa !9
  %1324 = fmul contract float %1323, 5.000000e-01
  %1325 = fcmp contract olt float %1324, 0.000000e+00
  %1326 = select i1 %1325, float 0x3FA1111120000000, float %1324
  store float %1326, float addrspace(1)* %1322, align 4, !tbaa !9
  %1327 = getelementptr inbounds float, float addrspace(1)* %0, i64 140
  store float %1326, float addrspace(1)* %1327, align 4, !tbaa !9
  %1328 = getelementptr inbounds float, float addrspace(1)* %0, i64 605
  %1329 = load float, float addrspace(1)* %1328, align 4, !tbaa !9
  %1330 = fmul contract float %1329, 5.000000e-01
  %1331 = fcmp contract olt float %1330, 0.000000e+00
  %1332 = select i1 %1331, float 0x3FA1111120000000, float %1330
  store float %1332, float addrspace(1)* %1328, align 4, !tbaa !9
  %1333 = getelementptr inbounds float, float addrspace(1)* %0, i64 170
  store float %1332, float addrspace(1)* %1333, align 4, !tbaa !9
  %1334 = getelementptr inbounds float, float addrspace(1)* %0, i64 606
  %1335 = load float, float addrspace(1)* %1334, align 4, !tbaa !9
  %1336 = fmul contract float %1335, 5.000000e-01
  %1337 = fcmp contract olt float %1336, 0.000000e+00
  %1338 = select i1 %1337, float 0x3FA1111120000000, float %1336
  store float %1338, float addrspace(1)* %1334, align 4, !tbaa !9
  %1339 = getelementptr inbounds float, float addrspace(1)* %0, i64 200
  store float %1338, float addrspace(1)* %1339, align 4, !tbaa !9
  %1340 = getelementptr inbounds float, float addrspace(1)* %0, i64 607
  %1341 = load float, float addrspace(1)* %1340, align 4, !tbaa !9
  %1342 = fmul contract float %1341, 5.000000e-01
  %1343 = fcmp contract olt float %1342, 0.000000e+00
  %1344 = select i1 %1343, float 0x3FA1111120000000, float %1342
  store float %1344, float addrspace(1)* %1340, align 4, !tbaa !9
  %1345 = getelementptr inbounds float, float addrspace(1)* %0, i64 230
  store float %1344, float addrspace(1)* %1345, align 4, !tbaa !9
  %1346 = getelementptr inbounds float, float addrspace(1)* %0, i64 608
  %1347 = load float, float addrspace(1)* %1346, align 4, !tbaa !9
  %1348 = fmul contract float %1347, 5.000000e-01
  %1349 = fcmp contract olt float %1348, 0.000000e+00
  %1350 = select i1 %1349, float 0x3FA1111120000000, float %1348
  store float %1350, float addrspace(1)* %1346, align 4, !tbaa !9
  %1351 = getelementptr inbounds float, float addrspace(1)* %0, i64 260
  store float %1350, float addrspace(1)* %1351, align 4, !tbaa !9
  %1352 = getelementptr inbounds float, float addrspace(1)* %0, i64 609
  %1353 = load float, float addrspace(1)* %1352, align 4, !tbaa !9
  %1354 = fmul contract float %1353, 5.000000e-01
  %1355 = fcmp contract olt float %1354, 0.000000e+00
  %1356 = select i1 %1355, float 0x3FA1111120000000, float %1354
  store float %1356, float addrspace(1)* %1352, align 4, !tbaa !9
  %1357 = getelementptr inbounds float, float addrspace(1)* %0, i64 290
  store float %1356, float addrspace(1)* %1357, align 4, !tbaa !9
  %1358 = getelementptr inbounds float, float addrspace(1)* %0, i64 610
  %1359 = load float, float addrspace(1)* %1358, align 4, !tbaa !9
  %1360 = fmul contract float %1359, 5.000000e-01
  %1361 = fcmp contract olt float %1360, 0.000000e+00
  %1362 = select i1 %1361, float 0x3FA1111120000000, float %1360
  store float %1362, float addrspace(1)* %1358, align 4, !tbaa !9
  %1363 = getelementptr inbounds float, float addrspace(1)* %0, i64 320
  store float %1362, float addrspace(1)* %1363, align 4, !tbaa !9
  %1364 = getelementptr inbounds float, float addrspace(1)* %0, i64 611
  %1365 = load float, float addrspace(1)* %1364, align 4, !tbaa !9
  %1366 = fmul contract float %1365, 5.000000e-01
  %1367 = fcmp contract olt float %1366, 0.000000e+00
  %1368 = select i1 %1367, float 0x3FA1111120000000, float %1366
  store float %1368, float addrspace(1)* %1364, align 4, !tbaa !9
  %1369 = getelementptr inbounds float, float addrspace(1)* %0, i64 350
  store float %1368, float addrspace(1)* %1369, align 4, !tbaa !9
  %1370 = getelementptr inbounds float, float addrspace(1)* %0, i64 612
  %1371 = load float, float addrspace(1)* %1370, align 4, !tbaa !9
  %1372 = fmul contract float %1371, 5.000000e-01
  %1373 = fcmp contract olt float %1372, 0.000000e+00
  %1374 = select i1 %1373, float 0x3FA1111120000000, float %1372
  store float %1374, float addrspace(1)* %1370, align 4, !tbaa !9
  %1375 = getelementptr inbounds float, float addrspace(1)* %0, i64 380
  store float %1374, float addrspace(1)* %1375, align 4, !tbaa !9
  %1376 = getelementptr inbounds float, float addrspace(1)* %0, i64 613
  %1377 = load float, float addrspace(1)* %1376, align 4, !tbaa !9
  %1378 = fmul contract float %1377, 5.000000e-01
  %1379 = fcmp contract olt float %1378, 0.000000e+00
  %1380 = select i1 %1379, float 0x3FA1111120000000, float %1378
  store float %1380, float addrspace(1)* %1376, align 4, !tbaa !9
  %1381 = getelementptr inbounds float, float addrspace(1)* %0, i64 410
  store float %1380, float addrspace(1)* %1381, align 4, !tbaa !9
  %1382 = getelementptr inbounds float, float addrspace(1)* %0, i64 614
  %1383 = load float, float addrspace(1)* %1382, align 4, !tbaa !9
  %1384 = fmul contract float %1383, 5.000000e-01
  %1385 = fcmp contract olt float %1384, 0.000000e+00
  %1386 = select i1 %1385, float 0x3FA1111120000000, float %1384
  store float %1386, float addrspace(1)* %1382, align 4, !tbaa !9
  %1387 = getelementptr inbounds float, float addrspace(1)* %0, i64 440
  store float %1386, float addrspace(1)* %1387, align 4, !tbaa !9
  %1388 = getelementptr inbounds float, float addrspace(1)* %0, i64 615
  %1389 = load float, float addrspace(1)* %1388, align 4, !tbaa !9
  %1390 = fmul contract float %1389, 5.000000e-01
  %1391 = fcmp contract olt float %1390, 0.000000e+00
  %1392 = select i1 %1391, float 0x3FA1111120000000, float %1390
  store float %1392, float addrspace(1)* %1388, align 4, !tbaa !9
  %1393 = getelementptr inbounds float, float addrspace(1)* %0, i64 470
  store float %1392, float addrspace(1)* %1393, align 4, !tbaa !9
  %1394 = getelementptr inbounds float, float addrspace(1)* %0, i64 616
  %1395 = load float, float addrspace(1)* %1394, align 4, !tbaa !9
  %1396 = fmul contract float %1395, 5.000000e-01
  %1397 = fcmp contract olt float %1396, 0.000000e+00
  %1398 = select i1 %1397, float 0x3FA1111120000000, float %1396
  store float %1398, float addrspace(1)* %1394, align 4, !tbaa !9
  %1399 = getelementptr inbounds float, float addrspace(1)* %0, i64 500
  store float %1398, float addrspace(1)* %1399, align 4, !tbaa !9
  %1400 = getelementptr inbounds float, float addrspace(1)* %0, i64 617
  %1401 = load float, float addrspace(1)* %1400, align 4, !tbaa !9
  %1402 = fmul contract float %1401, 5.000000e-01
  %1403 = fcmp contract olt float %1402, 0.000000e+00
  %1404 = select i1 %1403, float 0x3FA1111120000000, float %1402
  store float %1404, float addrspace(1)* %1400, align 4, !tbaa !9
  %1405 = getelementptr inbounds float, float addrspace(1)* %0, i64 530
  store float %1404, float addrspace(1)* %1405, align 4, !tbaa !9
  %1406 = getelementptr inbounds float, float addrspace(1)* %0, i64 618
  %1407 = load float, float addrspace(1)* %1406, align 4, !tbaa !9
  %1408 = fmul contract float %1407, 5.000000e-01
  %1409 = fcmp contract olt float %1408, 0.000000e+00
  %1410 = select i1 %1409, float 0x3FA1111120000000, float %1408
  store float %1410, float addrspace(1)* %1406, align 4, !tbaa !9
  %1411 = getelementptr inbounds float, float addrspace(1)* %0, i64 560
  store float %1410, float addrspace(1)* %1411, align 4, !tbaa !9
  %1412 = getelementptr inbounds float, float addrspace(1)* %0, i64 619
  %1413 = load float, float addrspace(1)* %1412, align 4, !tbaa !9
  %1414 = fmul contract float %1413, 5.000000e-01
  %1415 = fcmp contract olt float %1414, 0.000000e+00
  %1416 = select i1 %1415, float 0x3FA1111120000000, float %1414
  store float %1416, float addrspace(1)* %1412, align 4, !tbaa !9
  %1417 = getelementptr inbounds float, float addrspace(1)* %0, i64 590
  store float %1416, float addrspace(1)* %1417, align 4, !tbaa !9
  %1418 = getelementptr inbounds float, float addrspace(1)* %0, i64 630
  %1419 = load float, float addrspace(1)* %1418, align 4, !tbaa !9
  %1420 = fmul contract float %1419, 5.000000e-01
  %1421 = fcmp contract olt float %1420, 0.000000e+00
  %1422 = select i1 %1421, float 0x3FA1111120000000, float %1420
  store float %1422, float addrspace(1)* %1418, align 4, !tbaa !9
  %1423 = getelementptr inbounds float, float addrspace(1)* %0, i64 21
  store float %1422, float addrspace(1)* %1423, align 4, !tbaa !9
  %1424 = getelementptr inbounds float, float addrspace(1)* %0, i64 631
  %1425 = load float, float addrspace(1)* %1424, align 4, !tbaa !9
  %1426 = fmul contract float %1425, 5.000000e-01
  %1427 = fcmp contract olt float %1426, 0.000000e+00
  %1428 = select i1 %1427, float 0x3FA1111120000000, float %1426
  store float %1428, float addrspace(1)* %1424, align 4, !tbaa !9
  %1429 = getelementptr inbounds float, float addrspace(1)* %0, i64 51
  store float %1428, float addrspace(1)* %1429, align 4, !tbaa !9
  %1430 = getelementptr inbounds float, float addrspace(1)* %0, i64 632
  %1431 = load float, float addrspace(1)* %1430, align 4, !tbaa !9
  %1432 = fmul contract float %1431, 5.000000e-01
  %1433 = fcmp contract olt float %1432, 0.000000e+00
  %1434 = select i1 %1433, float 0x3FA1111120000000, float %1432
  store float %1434, float addrspace(1)* %1430, align 4, !tbaa !9
  %1435 = getelementptr inbounds float, float addrspace(1)* %0, i64 81
  store float %1434, float addrspace(1)* %1435, align 4, !tbaa !9
  %1436 = getelementptr inbounds float, float addrspace(1)* %0, i64 633
  %1437 = load float, float addrspace(1)* %1436, align 4, !tbaa !9
  %1438 = fmul contract float %1437, 5.000000e-01
  %1439 = fcmp contract olt float %1438, 0.000000e+00
  %1440 = select i1 %1439, float 0x3FA1111120000000, float %1438
  store float %1440, float addrspace(1)* %1436, align 4, !tbaa !9
  %1441 = getelementptr inbounds float, float addrspace(1)* %0, i64 111
  store float %1440, float addrspace(1)* %1441, align 4, !tbaa !9
  %1442 = getelementptr inbounds float, float addrspace(1)* %0, i64 634
  %1443 = load float, float addrspace(1)* %1442, align 4, !tbaa !9
  %1444 = fmul contract float %1443, 5.000000e-01
  %1445 = fcmp contract olt float %1444, 0.000000e+00
  %1446 = select i1 %1445, float 0x3FA1111120000000, float %1444
  store float %1446, float addrspace(1)* %1442, align 4, !tbaa !9
  %1447 = getelementptr inbounds float, float addrspace(1)* %0, i64 141
  store float %1446, float addrspace(1)* %1447, align 4, !tbaa !9
  %1448 = getelementptr inbounds float, float addrspace(1)* %0, i64 635
  %1449 = load float, float addrspace(1)* %1448, align 4, !tbaa !9
  %1450 = fmul contract float %1449, 5.000000e-01
  %1451 = fcmp contract olt float %1450, 0.000000e+00
  %1452 = select i1 %1451, float 0x3FA1111120000000, float %1450
  store float %1452, float addrspace(1)* %1448, align 4, !tbaa !9
  %1453 = getelementptr inbounds float, float addrspace(1)* %0, i64 171
  store float %1452, float addrspace(1)* %1453, align 4, !tbaa !9
  %1454 = getelementptr inbounds float, float addrspace(1)* %0, i64 636
  %1455 = load float, float addrspace(1)* %1454, align 4, !tbaa !9
  %1456 = fmul contract float %1455, 5.000000e-01
  %1457 = fcmp contract olt float %1456, 0.000000e+00
  %1458 = select i1 %1457, float 0x3FA1111120000000, float %1456
  store float %1458, float addrspace(1)* %1454, align 4, !tbaa !9
  %1459 = getelementptr inbounds float, float addrspace(1)* %0, i64 201
  store float %1458, float addrspace(1)* %1459, align 4, !tbaa !9
  %1460 = getelementptr inbounds float, float addrspace(1)* %0, i64 637
  %1461 = load float, float addrspace(1)* %1460, align 4, !tbaa !9
  %1462 = fmul contract float %1461, 5.000000e-01
  %1463 = fcmp contract olt float %1462, 0.000000e+00
  %1464 = select i1 %1463, float 0x3FA1111120000000, float %1462
  store float %1464, float addrspace(1)* %1460, align 4, !tbaa !9
  %1465 = getelementptr inbounds float, float addrspace(1)* %0, i64 231
  store float %1464, float addrspace(1)* %1465, align 4, !tbaa !9
  %1466 = getelementptr inbounds float, float addrspace(1)* %0, i64 638
  %1467 = load float, float addrspace(1)* %1466, align 4, !tbaa !9
  %1468 = fmul contract float %1467, 5.000000e-01
  %1469 = fcmp contract olt float %1468, 0.000000e+00
  %1470 = select i1 %1469, float 0x3FA1111120000000, float %1468
  store float %1470, float addrspace(1)* %1466, align 4, !tbaa !9
  %1471 = getelementptr inbounds float, float addrspace(1)* %0, i64 261
  store float %1470, float addrspace(1)* %1471, align 4, !tbaa !9
  %1472 = getelementptr inbounds float, float addrspace(1)* %0, i64 639
  %1473 = load float, float addrspace(1)* %1472, align 4, !tbaa !9
  %1474 = fmul contract float %1473, 5.000000e-01
  %1475 = fcmp contract olt float %1474, 0.000000e+00
  %1476 = select i1 %1475, float 0x3FA1111120000000, float %1474
  store float %1476, float addrspace(1)* %1472, align 4, !tbaa !9
  %1477 = getelementptr inbounds float, float addrspace(1)* %0, i64 291
  store float %1476, float addrspace(1)* %1477, align 4, !tbaa !9
  %1478 = getelementptr inbounds float, float addrspace(1)* %0, i64 640
  %1479 = load float, float addrspace(1)* %1478, align 4, !tbaa !9
  %1480 = fmul contract float %1479, 5.000000e-01
  %1481 = fcmp contract olt float %1480, 0.000000e+00
  %1482 = select i1 %1481, float 0x3FA1111120000000, float %1480
  store float %1482, float addrspace(1)* %1478, align 4, !tbaa !9
  %1483 = getelementptr inbounds float, float addrspace(1)* %0, i64 321
  store float %1482, float addrspace(1)* %1483, align 4, !tbaa !9
  %1484 = getelementptr inbounds float, float addrspace(1)* %0, i64 641
  %1485 = load float, float addrspace(1)* %1484, align 4, !tbaa !9
  %1486 = fmul contract float %1485, 5.000000e-01
  %1487 = fcmp contract olt float %1486, 0.000000e+00
  %1488 = select i1 %1487, float 0x3FA1111120000000, float %1486
  store float %1488, float addrspace(1)* %1484, align 4, !tbaa !9
  %1489 = getelementptr inbounds float, float addrspace(1)* %0, i64 351
  store float %1488, float addrspace(1)* %1489, align 4, !tbaa !9
  %1490 = getelementptr inbounds float, float addrspace(1)* %0, i64 642
  %1491 = load float, float addrspace(1)* %1490, align 4, !tbaa !9
  %1492 = fmul contract float %1491, 5.000000e-01
  %1493 = fcmp contract olt float %1492, 0.000000e+00
  %1494 = select i1 %1493, float 0x3FA1111120000000, float %1492
  store float %1494, float addrspace(1)* %1490, align 4, !tbaa !9
  %1495 = getelementptr inbounds float, float addrspace(1)* %0, i64 381
  store float %1494, float addrspace(1)* %1495, align 4, !tbaa !9
  %1496 = getelementptr inbounds float, float addrspace(1)* %0, i64 643
  %1497 = load float, float addrspace(1)* %1496, align 4, !tbaa !9
  %1498 = fmul contract float %1497, 5.000000e-01
  %1499 = fcmp contract olt float %1498, 0.000000e+00
  %1500 = select i1 %1499, float 0x3FA1111120000000, float %1498
  store float %1500, float addrspace(1)* %1496, align 4, !tbaa !9
  %1501 = getelementptr inbounds float, float addrspace(1)* %0, i64 411
  store float %1500, float addrspace(1)* %1501, align 4, !tbaa !9
  %1502 = getelementptr inbounds float, float addrspace(1)* %0, i64 644
  %1503 = load float, float addrspace(1)* %1502, align 4, !tbaa !9
  %1504 = fmul contract float %1503, 5.000000e-01
  %1505 = fcmp contract olt float %1504, 0.000000e+00
  %1506 = select i1 %1505, float 0x3FA1111120000000, float %1504
  store float %1506, float addrspace(1)* %1502, align 4, !tbaa !9
  %1507 = getelementptr inbounds float, float addrspace(1)* %0, i64 441
  store float %1506, float addrspace(1)* %1507, align 4, !tbaa !9
  %1508 = getelementptr inbounds float, float addrspace(1)* %0, i64 645
  %1509 = load float, float addrspace(1)* %1508, align 4, !tbaa !9
  %1510 = fmul contract float %1509, 5.000000e-01
  %1511 = fcmp contract olt float %1510, 0.000000e+00
  %1512 = select i1 %1511, float 0x3FA1111120000000, float %1510
  store float %1512, float addrspace(1)* %1508, align 4, !tbaa !9
  %1513 = getelementptr inbounds float, float addrspace(1)* %0, i64 471
  store float %1512, float addrspace(1)* %1513, align 4, !tbaa !9
  %1514 = getelementptr inbounds float, float addrspace(1)* %0, i64 646
  %1515 = load float, float addrspace(1)* %1514, align 4, !tbaa !9
  %1516 = fmul contract float %1515, 5.000000e-01
  %1517 = fcmp contract olt float %1516, 0.000000e+00
  %1518 = select i1 %1517, float 0x3FA1111120000000, float %1516
  store float %1518, float addrspace(1)* %1514, align 4, !tbaa !9
  %1519 = getelementptr inbounds float, float addrspace(1)* %0, i64 501
  store float %1518, float addrspace(1)* %1519, align 4, !tbaa !9
  %1520 = getelementptr inbounds float, float addrspace(1)* %0, i64 647
  %1521 = load float, float addrspace(1)* %1520, align 4, !tbaa !9
  %1522 = fmul contract float %1521, 5.000000e-01
  %1523 = fcmp contract olt float %1522, 0.000000e+00
  %1524 = select i1 %1523, float 0x3FA1111120000000, float %1522
  store float %1524, float addrspace(1)* %1520, align 4, !tbaa !9
  %1525 = getelementptr inbounds float, float addrspace(1)* %0, i64 531
  store float %1524, float addrspace(1)* %1525, align 4, !tbaa !9
  %1526 = getelementptr inbounds float, float addrspace(1)* %0, i64 648
  %1527 = load float, float addrspace(1)* %1526, align 4, !tbaa !9
  %1528 = fmul contract float %1527, 5.000000e-01
  %1529 = fcmp contract olt float %1528, 0.000000e+00
  %1530 = select i1 %1529, float 0x3FA1111120000000, float %1528
  store float %1530, float addrspace(1)* %1526, align 4, !tbaa !9
  %1531 = getelementptr inbounds float, float addrspace(1)* %0, i64 561
  store float %1530, float addrspace(1)* %1531, align 4, !tbaa !9
  %1532 = getelementptr inbounds float, float addrspace(1)* %0, i64 649
  %1533 = load float, float addrspace(1)* %1532, align 4, !tbaa !9
  %1534 = fmul contract float %1533, 5.000000e-01
  %1535 = fcmp contract olt float %1534, 0.000000e+00
  %1536 = select i1 %1535, float 0x3FA1111120000000, float %1534
  store float %1536, float addrspace(1)* %1532, align 4, !tbaa !9
  %1537 = getelementptr inbounds float, float addrspace(1)* %0, i64 591
  store float %1536, float addrspace(1)* %1537, align 4, !tbaa !9
  %1538 = getelementptr inbounds float, float addrspace(1)* %0, i64 650
  %1539 = load float, float addrspace(1)* %1538, align 4, !tbaa !9
  %1540 = fmul contract float %1539, 5.000000e-01
  %1541 = fcmp contract olt float %1540, 0.000000e+00
  %1542 = select i1 %1541, float 0x3FA1111120000000, float %1540
  store float %1542, float addrspace(1)* %1538, align 4, !tbaa !9
  %1543 = getelementptr inbounds float, float addrspace(1)* %0, i64 621
  store float %1542, float addrspace(1)* %1543, align 4, !tbaa !9
  %1544 = getelementptr inbounds float, float addrspace(1)* %0, i64 660
  %1545 = load float, float addrspace(1)* %1544, align 4, !tbaa !9
  %1546 = fmul contract float %1545, 5.000000e-01
  %1547 = fcmp contract olt float %1546, 0.000000e+00
  %1548 = select i1 %1547, float 0x3FA1111120000000, float %1546
  store float %1548, float addrspace(1)* %1544, align 4, !tbaa !9
  %1549 = getelementptr inbounds float, float addrspace(1)* %0, i64 22
  store float %1548, float addrspace(1)* %1549, align 4, !tbaa !9
  %1550 = getelementptr inbounds float, float addrspace(1)* %0, i64 661
  %1551 = load float, float addrspace(1)* %1550, align 4, !tbaa !9
  %1552 = fmul contract float %1551, 5.000000e-01
  %1553 = fcmp contract olt float %1552, 0.000000e+00
  %1554 = select i1 %1553, float 0x3FA1111120000000, float %1552
  store float %1554, float addrspace(1)* %1550, align 4, !tbaa !9
  %1555 = getelementptr inbounds float, float addrspace(1)* %0, i64 52
  store float %1554, float addrspace(1)* %1555, align 4, !tbaa !9
  %1556 = getelementptr inbounds float, float addrspace(1)* %0, i64 662
  %1557 = load float, float addrspace(1)* %1556, align 4, !tbaa !9
  %1558 = fmul contract float %1557, 5.000000e-01
  %1559 = fcmp contract olt float %1558, 0.000000e+00
  %1560 = select i1 %1559, float 0x3FA1111120000000, float %1558
  store float %1560, float addrspace(1)* %1556, align 4, !tbaa !9
  %1561 = getelementptr inbounds float, float addrspace(1)* %0, i64 82
  store float %1560, float addrspace(1)* %1561, align 4, !tbaa !9
  %1562 = getelementptr inbounds float, float addrspace(1)* %0, i64 663
  %1563 = load float, float addrspace(1)* %1562, align 4, !tbaa !9
  %1564 = fmul contract float %1563, 5.000000e-01
  %1565 = fcmp contract olt float %1564, 0.000000e+00
  %1566 = select i1 %1565, float 0x3FA1111120000000, float %1564
  store float %1566, float addrspace(1)* %1562, align 4, !tbaa !9
  %1567 = getelementptr inbounds float, float addrspace(1)* %0, i64 112
  store float %1566, float addrspace(1)* %1567, align 4, !tbaa !9
  %1568 = getelementptr inbounds float, float addrspace(1)* %0, i64 664
  %1569 = load float, float addrspace(1)* %1568, align 4, !tbaa !9
  %1570 = fmul contract float %1569, 5.000000e-01
  %1571 = fcmp contract olt float %1570, 0.000000e+00
  %1572 = select i1 %1571, float 0x3FA1111120000000, float %1570
  store float %1572, float addrspace(1)* %1568, align 4, !tbaa !9
  %1573 = getelementptr inbounds float, float addrspace(1)* %0, i64 142
  store float %1572, float addrspace(1)* %1573, align 4, !tbaa !9
  %1574 = getelementptr inbounds float, float addrspace(1)* %0, i64 665
  %1575 = load float, float addrspace(1)* %1574, align 4, !tbaa !9
  %1576 = fmul contract float %1575, 5.000000e-01
  %1577 = fcmp contract olt float %1576, 0.000000e+00
  %1578 = select i1 %1577, float 0x3FA1111120000000, float %1576
  store float %1578, float addrspace(1)* %1574, align 4, !tbaa !9
  %1579 = getelementptr inbounds float, float addrspace(1)* %0, i64 172
  store float %1578, float addrspace(1)* %1579, align 4, !tbaa !9
  %1580 = getelementptr inbounds float, float addrspace(1)* %0, i64 666
  %1581 = load float, float addrspace(1)* %1580, align 4, !tbaa !9
  %1582 = fmul contract float %1581, 5.000000e-01
  %1583 = fcmp contract olt float %1582, 0.000000e+00
  %1584 = select i1 %1583, float 0x3FA1111120000000, float %1582
  store float %1584, float addrspace(1)* %1580, align 4, !tbaa !9
  %1585 = getelementptr inbounds float, float addrspace(1)* %0, i64 202
  store float %1584, float addrspace(1)* %1585, align 4, !tbaa !9
  %1586 = getelementptr inbounds float, float addrspace(1)* %0, i64 667
  %1587 = load float, float addrspace(1)* %1586, align 4, !tbaa !9
  %1588 = fmul contract float %1587, 5.000000e-01
  %1589 = fcmp contract olt float %1588, 0.000000e+00
  %1590 = select i1 %1589, float 0x3FA1111120000000, float %1588
  store float %1590, float addrspace(1)* %1586, align 4, !tbaa !9
  %1591 = getelementptr inbounds float, float addrspace(1)* %0, i64 232
  store float %1590, float addrspace(1)* %1591, align 4, !tbaa !9
  %1592 = getelementptr inbounds float, float addrspace(1)* %0, i64 668
  %1593 = load float, float addrspace(1)* %1592, align 4, !tbaa !9
  %1594 = fmul contract float %1593, 5.000000e-01
  %1595 = fcmp contract olt float %1594, 0.000000e+00
  %1596 = select i1 %1595, float 0x3FA1111120000000, float %1594
  store float %1596, float addrspace(1)* %1592, align 4, !tbaa !9
  %1597 = getelementptr inbounds float, float addrspace(1)* %0, i64 262
  store float %1596, float addrspace(1)* %1597, align 4, !tbaa !9
  %1598 = getelementptr inbounds float, float addrspace(1)* %0, i64 669
  %1599 = load float, float addrspace(1)* %1598, align 4, !tbaa !9
  %1600 = fmul contract float %1599, 5.000000e-01
  %1601 = fcmp contract olt float %1600, 0.000000e+00
  %1602 = select i1 %1601, float 0x3FA1111120000000, float %1600
  store float %1602, float addrspace(1)* %1598, align 4, !tbaa !9
  %1603 = getelementptr inbounds float, float addrspace(1)* %0, i64 292
  store float %1602, float addrspace(1)* %1603, align 4, !tbaa !9
  %1604 = getelementptr inbounds float, float addrspace(1)* %0, i64 670
  %1605 = load float, float addrspace(1)* %1604, align 4, !tbaa !9
  %1606 = fmul contract float %1605, 5.000000e-01
  %1607 = fcmp contract olt float %1606, 0.000000e+00
  %1608 = select i1 %1607, float 0x3FA1111120000000, float %1606
  store float %1608, float addrspace(1)* %1604, align 4, !tbaa !9
  %1609 = getelementptr inbounds float, float addrspace(1)* %0, i64 322
  store float %1608, float addrspace(1)* %1609, align 4, !tbaa !9
  %1610 = getelementptr inbounds float, float addrspace(1)* %0, i64 671
  %1611 = load float, float addrspace(1)* %1610, align 4, !tbaa !9
  %1612 = fmul contract float %1611, 5.000000e-01
  %1613 = fcmp contract olt float %1612, 0.000000e+00
  %1614 = select i1 %1613, float 0x3FA1111120000000, float %1612
  store float %1614, float addrspace(1)* %1610, align 4, !tbaa !9
  %1615 = getelementptr inbounds float, float addrspace(1)* %0, i64 352
  store float %1614, float addrspace(1)* %1615, align 4, !tbaa !9
  %1616 = getelementptr inbounds float, float addrspace(1)* %0, i64 672
  %1617 = load float, float addrspace(1)* %1616, align 4, !tbaa !9
  %1618 = fmul contract float %1617, 5.000000e-01
  %1619 = fcmp contract olt float %1618, 0.000000e+00
  %1620 = select i1 %1619, float 0x3FA1111120000000, float %1618
  store float %1620, float addrspace(1)* %1616, align 4, !tbaa !9
  %1621 = getelementptr inbounds float, float addrspace(1)* %0, i64 382
  store float %1620, float addrspace(1)* %1621, align 4, !tbaa !9
  %1622 = getelementptr inbounds float, float addrspace(1)* %0, i64 673
  %1623 = load float, float addrspace(1)* %1622, align 4, !tbaa !9
  %1624 = fmul contract float %1623, 5.000000e-01
  %1625 = fcmp contract olt float %1624, 0.000000e+00
  %1626 = select i1 %1625, float 0x3FA1111120000000, float %1624
  store float %1626, float addrspace(1)* %1622, align 4, !tbaa !9
  %1627 = getelementptr inbounds float, float addrspace(1)* %0, i64 412
  store float %1626, float addrspace(1)* %1627, align 4, !tbaa !9
  %1628 = getelementptr inbounds float, float addrspace(1)* %0, i64 674
  %1629 = load float, float addrspace(1)* %1628, align 4, !tbaa !9
  %1630 = fmul contract float %1629, 5.000000e-01
  %1631 = fcmp contract olt float %1630, 0.000000e+00
  %1632 = select i1 %1631, float 0x3FA1111120000000, float %1630
  store float %1632, float addrspace(1)* %1628, align 4, !tbaa !9
  %1633 = getelementptr inbounds float, float addrspace(1)* %0, i64 442
  store float %1632, float addrspace(1)* %1633, align 4, !tbaa !9
  %1634 = getelementptr inbounds float, float addrspace(1)* %0, i64 675
  %1635 = load float, float addrspace(1)* %1634, align 4, !tbaa !9
  %1636 = fmul contract float %1635, 5.000000e-01
  %1637 = fcmp contract olt float %1636, 0.000000e+00
  %1638 = select i1 %1637, float 0x3FA1111120000000, float %1636
  store float %1638, float addrspace(1)* %1634, align 4, !tbaa !9
  %1639 = getelementptr inbounds float, float addrspace(1)* %0, i64 472
  store float %1638, float addrspace(1)* %1639, align 4, !tbaa !9
  %1640 = getelementptr inbounds float, float addrspace(1)* %0, i64 676
  %1641 = load float, float addrspace(1)* %1640, align 4, !tbaa !9
  %1642 = fmul contract float %1641, 5.000000e-01
  %1643 = fcmp contract olt float %1642, 0.000000e+00
  %1644 = select i1 %1643, float 0x3FA1111120000000, float %1642
  store float %1644, float addrspace(1)* %1640, align 4, !tbaa !9
  %1645 = getelementptr inbounds float, float addrspace(1)* %0, i64 502
  store float %1644, float addrspace(1)* %1645, align 4, !tbaa !9
  %1646 = getelementptr inbounds float, float addrspace(1)* %0, i64 677
  %1647 = load float, float addrspace(1)* %1646, align 4, !tbaa !9
  %1648 = fmul contract float %1647, 5.000000e-01
  %1649 = fcmp contract olt float %1648, 0.000000e+00
  %1650 = select i1 %1649, float 0x3FA1111120000000, float %1648
  store float %1650, float addrspace(1)* %1646, align 4, !tbaa !9
  %1651 = getelementptr inbounds float, float addrspace(1)* %0, i64 532
  store float %1650, float addrspace(1)* %1651, align 4, !tbaa !9
  %1652 = getelementptr inbounds float, float addrspace(1)* %0, i64 678
  %1653 = load float, float addrspace(1)* %1652, align 4, !tbaa !9
  %1654 = fmul contract float %1653, 5.000000e-01
  %1655 = fcmp contract olt float %1654, 0.000000e+00
  %1656 = select i1 %1655, float 0x3FA1111120000000, float %1654
  store float %1656, float addrspace(1)* %1652, align 4, !tbaa !9
  %1657 = getelementptr inbounds float, float addrspace(1)* %0, i64 562
  store float %1656, float addrspace(1)* %1657, align 4, !tbaa !9
  %1658 = getelementptr inbounds float, float addrspace(1)* %0, i64 679
  %1659 = load float, float addrspace(1)* %1658, align 4, !tbaa !9
  %1660 = fmul contract float %1659, 5.000000e-01
  %1661 = fcmp contract olt float %1660, 0.000000e+00
  %1662 = select i1 %1661, float 0x3FA1111120000000, float %1660
  store float %1662, float addrspace(1)* %1658, align 4, !tbaa !9
  %1663 = getelementptr inbounds float, float addrspace(1)* %0, i64 592
  store float %1662, float addrspace(1)* %1663, align 4, !tbaa !9
  %1664 = getelementptr inbounds float, float addrspace(1)* %0, i64 680
  %1665 = load float, float addrspace(1)* %1664, align 4, !tbaa !9
  %1666 = fmul contract float %1665, 5.000000e-01
  %1667 = fcmp contract olt float %1666, 0.000000e+00
  %1668 = select i1 %1667, float 0x3FA1111120000000, float %1666
  store float %1668, float addrspace(1)* %1664, align 4, !tbaa !9
  %1669 = getelementptr inbounds float, float addrspace(1)* %0, i64 622
  store float %1668, float addrspace(1)* %1669, align 4, !tbaa !9
  %1670 = getelementptr inbounds float, float addrspace(1)* %0, i64 681
  %1671 = load float, float addrspace(1)* %1670, align 4, !tbaa !9
  %1672 = fmul contract float %1671, 5.000000e-01
  %1673 = fcmp contract olt float %1672, 0.000000e+00
  %1674 = select i1 %1673, float 0x3FA1111120000000, float %1672
  store float %1674, float addrspace(1)* %1670, align 4, !tbaa !9
  %1675 = getelementptr inbounds float, float addrspace(1)* %0, i64 652
  store float %1674, float addrspace(1)* %1675, align 4, !tbaa !9
  %1676 = getelementptr inbounds float, float addrspace(1)* %0, i64 690
  %1677 = load float, float addrspace(1)* %1676, align 4, !tbaa !9
  %1678 = fmul contract float %1677, 5.000000e-01
  %1679 = fcmp contract olt float %1678, 0.000000e+00
  %1680 = select i1 %1679, float 0x3FA1111120000000, float %1678
  store float %1680, float addrspace(1)* %1676, align 4, !tbaa !9
  %1681 = getelementptr inbounds float, float addrspace(1)* %0, i64 23
  store float %1680, float addrspace(1)* %1681, align 4, !tbaa !9
  %1682 = getelementptr inbounds float, float addrspace(1)* %0, i64 691
  %1683 = load float, float addrspace(1)* %1682, align 4, !tbaa !9
  %1684 = fmul contract float %1683, 5.000000e-01
  %1685 = fcmp contract olt float %1684, 0.000000e+00
  %1686 = select i1 %1685, float 0x3FA1111120000000, float %1684
  store float %1686, float addrspace(1)* %1682, align 4, !tbaa !9
  %1687 = getelementptr inbounds float, float addrspace(1)* %0, i64 53
  store float %1686, float addrspace(1)* %1687, align 4, !tbaa !9
  %1688 = getelementptr inbounds float, float addrspace(1)* %0, i64 692
  %1689 = load float, float addrspace(1)* %1688, align 4, !tbaa !9
  %1690 = fmul contract float %1689, 5.000000e-01
  %1691 = fcmp contract olt float %1690, 0.000000e+00
  %1692 = select i1 %1691, float 0x3FA1111120000000, float %1690
  store float %1692, float addrspace(1)* %1688, align 4, !tbaa !9
  %1693 = getelementptr inbounds float, float addrspace(1)* %0, i64 83
  store float %1692, float addrspace(1)* %1693, align 4, !tbaa !9
  %1694 = getelementptr inbounds float, float addrspace(1)* %0, i64 693
  %1695 = load float, float addrspace(1)* %1694, align 4, !tbaa !9
  %1696 = fmul contract float %1695, 5.000000e-01
  %1697 = fcmp contract olt float %1696, 0.000000e+00
  %1698 = select i1 %1697, float 0x3FA1111120000000, float %1696
  store float %1698, float addrspace(1)* %1694, align 4, !tbaa !9
  %1699 = getelementptr inbounds float, float addrspace(1)* %0, i64 113
  store float %1698, float addrspace(1)* %1699, align 4, !tbaa !9
  %1700 = getelementptr inbounds float, float addrspace(1)* %0, i64 694
  %1701 = load float, float addrspace(1)* %1700, align 4, !tbaa !9
  %1702 = fmul contract float %1701, 5.000000e-01
  %1703 = fcmp contract olt float %1702, 0.000000e+00
  %1704 = select i1 %1703, float 0x3FA1111120000000, float %1702
  store float %1704, float addrspace(1)* %1700, align 4, !tbaa !9
  %1705 = getelementptr inbounds float, float addrspace(1)* %0, i64 143
  store float %1704, float addrspace(1)* %1705, align 4, !tbaa !9
  %1706 = getelementptr inbounds float, float addrspace(1)* %0, i64 695
  %1707 = load float, float addrspace(1)* %1706, align 4, !tbaa !9
  %1708 = fmul contract float %1707, 5.000000e-01
  %1709 = fcmp contract olt float %1708, 0.000000e+00
  %1710 = select i1 %1709, float 0x3FA1111120000000, float %1708
  store float %1710, float addrspace(1)* %1706, align 4, !tbaa !9
  %1711 = getelementptr inbounds float, float addrspace(1)* %0, i64 173
  store float %1710, float addrspace(1)* %1711, align 4, !tbaa !9
  %1712 = getelementptr inbounds float, float addrspace(1)* %0, i64 696
  %1713 = load float, float addrspace(1)* %1712, align 4, !tbaa !9
  %1714 = fmul contract float %1713, 5.000000e-01
  %1715 = fcmp contract olt float %1714, 0.000000e+00
  %1716 = select i1 %1715, float 0x3FA1111120000000, float %1714
  store float %1716, float addrspace(1)* %1712, align 4, !tbaa !9
  %1717 = getelementptr inbounds float, float addrspace(1)* %0, i64 203
  store float %1716, float addrspace(1)* %1717, align 4, !tbaa !9
  %1718 = getelementptr inbounds float, float addrspace(1)* %0, i64 697
  %1719 = load float, float addrspace(1)* %1718, align 4, !tbaa !9
  %1720 = fmul contract float %1719, 5.000000e-01
  %1721 = fcmp contract olt float %1720, 0.000000e+00
  %1722 = select i1 %1721, float 0x3FA1111120000000, float %1720
  store float %1722, float addrspace(1)* %1718, align 4, !tbaa !9
  %1723 = getelementptr inbounds float, float addrspace(1)* %0, i64 233
  store float %1722, float addrspace(1)* %1723, align 4, !tbaa !9
  %1724 = getelementptr inbounds float, float addrspace(1)* %0, i64 698
  %1725 = load float, float addrspace(1)* %1724, align 4, !tbaa !9
  %1726 = fmul contract float %1725, 5.000000e-01
  %1727 = fcmp contract olt float %1726, 0.000000e+00
  %1728 = select i1 %1727, float 0x3FA1111120000000, float %1726
  store float %1728, float addrspace(1)* %1724, align 4, !tbaa !9
  %1729 = getelementptr inbounds float, float addrspace(1)* %0, i64 263
  store float %1728, float addrspace(1)* %1729, align 4, !tbaa !9
  %1730 = getelementptr inbounds float, float addrspace(1)* %0, i64 699
  %1731 = load float, float addrspace(1)* %1730, align 4, !tbaa !9
  %1732 = fmul contract float %1731, 5.000000e-01
  %1733 = fcmp contract olt float %1732, 0.000000e+00
  %1734 = select i1 %1733, float 0x3FA1111120000000, float %1732
  store float %1734, float addrspace(1)* %1730, align 4, !tbaa !9
  %1735 = getelementptr inbounds float, float addrspace(1)* %0, i64 293
  store float %1734, float addrspace(1)* %1735, align 4, !tbaa !9
  %1736 = getelementptr inbounds float, float addrspace(1)* %0, i64 700
  %1737 = load float, float addrspace(1)* %1736, align 4, !tbaa !9
  %1738 = fmul contract float %1737, 5.000000e-01
  %1739 = fcmp contract olt float %1738, 0.000000e+00
  %1740 = select i1 %1739, float 0x3FA1111120000000, float %1738
  store float %1740, float addrspace(1)* %1736, align 4, !tbaa !9
  %1741 = getelementptr inbounds float, float addrspace(1)* %0, i64 323
  store float %1740, float addrspace(1)* %1741, align 4, !tbaa !9
  %1742 = getelementptr inbounds float, float addrspace(1)* %0, i64 701
  %1743 = load float, float addrspace(1)* %1742, align 4, !tbaa !9
  %1744 = fmul contract float %1743, 5.000000e-01
  %1745 = fcmp contract olt float %1744, 0.000000e+00
  %1746 = select i1 %1745, float 0x3FA1111120000000, float %1744
  store float %1746, float addrspace(1)* %1742, align 4, !tbaa !9
  %1747 = getelementptr inbounds float, float addrspace(1)* %0, i64 353
  store float %1746, float addrspace(1)* %1747, align 4, !tbaa !9
  %1748 = getelementptr inbounds float, float addrspace(1)* %0, i64 702
  %1749 = load float, float addrspace(1)* %1748, align 4, !tbaa !9
  %1750 = fmul contract float %1749, 5.000000e-01
  %1751 = fcmp contract olt float %1750, 0.000000e+00
  %1752 = select i1 %1751, float 0x3FA1111120000000, float %1750
  store float %1752, float addrspace(1)* %1748, align 4, !tbaa !9
  %1753 = getelementptr inbounds float, float addrspace(1)* %0, i64 383
  store float %1752, float addrspace(1)* %1753, align 4, !tbaa !9
  %1754 = getelementptr inbounds float, float addrspace(1)* %0, i64 703
  %1755 = load float, float addrspace(1)* %1754, align 4, !tbaa !9
  %1756 = fmul contract float %1755, 5.000000e-01
  %1757 = fcmp contract olt float %1756, 0.000000e+00
  %1758 = select i1 %1757, float 0x3FA1111120000000, float %1756
  store float %1758, float addrspace(1)* %1754, align 4, !tbaa !9
  %1759 = getelementptr inbounds float, float addrspace(1)* %0, i64 413
  store float %1758, float addrspace(1)* %1759, align 4, !tbaa !9
  %1760 = getelementptr inbounds float, float addrspace(1)* %0, i64 704
  %1761 = load float, float addrspace(1)* %1760, align 4, !tbaa !9
  %1762 = fmul contract float %1761, 5.000000e-01
  %1763 = fcmp contract olt float %1762, 0.000000e+00
  %1764 = select i1 %1763, float 0x3FA1111120000000, float %1762
  store float %1764, float addrspace(1)* %1760, align 4, !tbaa !9
  %1765 = getelementptr inbounds float, float addrspace(1)* %0, i64 443
  store float %1764, float addrspace(1)* %1765, align 4, !tbaa !9
  %1766 = getelementptr inbounds float, float addrspace(1)* %0, i64 705
  %1767 = load float, float addrspace(1)* %1766, align 4, !tbaa !9
  %1768 = fmul contract float %1767, 5.000000e-01
  %1769 = fcmp contract olt float %1768, 0.000000e+00
  %1770 = select i1 %1769, float 0x3FA1111120000000, float %1768
  store float %1770, float addrspace(1)* %1766, align 4, !tbaa !9
  %1771 = getelementptr inbounds float, float addrspace(1)* %0, i64 473
  store float %1770, float addrspace(1)* %1771, align 4, !tbaa !9
  %1772 = getelementptr inbounds float, float addrspace(1)* %0, i64 706
  %1773 = load float, float addrspace(1)* %1772, align 4, !tbaa !9
  %1774 = fmul contract float %1773, 5.000000e-01
  %1775 = fcmp contract olt float %1774, 0.000000e+00
  %1776 = select i1 %1775, float 0x3FA1111120000000, float %1774
  store float %1776, float addrspace(1)* %1772, align 4, !tbaa !9
  %1777 = getelementptr inbounds float, float addrspace(1)* %0, i64 503
  store float %1776, float addrspace(1)* %1777, align 4, !tbaa !9
  %1778 = getelementptr inbounds float, float addrspace(1)* %0, i64 707
  %1779 = load float, float addrspace(1)* %1778, align 4, !tbaa !9
  %1780 = fmul contract float %1779, 5.000000e-01
  %1781 = fcmp contract olt float %1780, 0.000000e+00
  %1782 = select i1 %1781, float 0x3FA1111120000000, float %1780
  store float %1782, float addrspace(1)* %1778, align 4, !tbaa !9
  %1783 = getelementptr inbounds float, float addrspace(1)* %0, i64 533
  store float %1782, float addrspace(1)* %1783, align 4, !tbaa !9
  %1784 = getelementptr inbounds float, float addrspace(1)* %0, i64 708
  %1785 = load float, float addrspace(1)* %1784, align 4, !tbaa !9
  %1786 = fmul contract float %1785, 5.000000e-01
  %1787 = fcmp contract olt float %1786, 0.000000e+00
  %1788 = select i1 %1787, float 0x3FA1111120000000, float %1786
  store float %1788, float addrspace(1)* %1784, align 4, !tbaa !9
  %1789 = getelementptr inbounds float, float addrspace(1)* %0, i64 563
  store float %1788, float addrspace(1)* %1789, align 4, !tbaa !9
  %1790 = getelementptr inbounds float, float addrspace(1)* %0, i64 709
  %1791 = load float, float addrspace(1)* %1790, align 4, !tbaa !9
  %1792 = fmul contract float %1791, 5.000000e-01
  %1793 = fcmp contract olt float %1792, 0.000000e+00
  %1794 = select i1 %1793, float 0x3FA1111120000000, float %1792
  store float %1794, float addrspace(1)* %1790, align 4, !tbaa !9
  %1795 = getelementptr inbounds float, float addrspace(1)* %0, i64 593
  store float %1794, float addrspace(1)* %1795, align 4, !tbaa !9
  %1796 = getelementptr inbounds float, float addrspace(1)* %0, i64 710
  %1797 = load float, float addrspace(1)* %1796, align 4, !tbaa !9
  %1798 = fmul contract float %1797, 5.000000e-01
  %1799 = fcmp contract olt float %1798, 0.000000e+00
  %1800 = select i1 %1799, float 0x3FA1111120000000, float %1798
  store float %1800, float addrspace(1)* %1796, align 4, !tbaa !9
  %1801 = getelementptr inbounds float, float addrspace(1)* %0, i64 623
  store float %1800, float addrspace(1)* %1801, align 4, !tbaa !9
  %1802 = getelementptr inbounds float, float addrspace(1)* %0, i64 711
  %1803 = load float, float addrspace(1)* %1802, align 4, !tbaa !9
  %1804 = fmul contract float %1803, 5.000000e-01
  %1805 = fcmp contract olt float %1804, 0.000000e+00
  %1806 = select i1 %1805, float 0x3FA1111120000000, float %1804
  store float %1806, float addrspace(1)* %1802, align 4, !tbaa !9
  %1807 = getelementptr inbounds float, float addrspace(1)* %0, i64 653
  store float %1806, float addrspace(1)* %1807, align 4, !tbaa !9
  %1808 = getelementptr inbounds float, float addrspace(1)* %0, i64 712
  %1809 = load float, float addrspace(1)* %1808, align 4, !tbaa !9
  %1810 = fmul contract float %1809, 5.000000e-01
  %1811 = fcmp contract olt float %1810, 0.000000e+00
  %1812 = select i1 %1811, float 0x3FA1111120000000, float %1810
  store float %1812, float addrspace(1)* %1808, align 4, !tbaa !9
  %1813 = getelementptr inbounds float, float addrspace(1)* %0, i64 683
  store float %1812, float addrspace(1)* %1813, align 4, !tbaa !9
  %1814 = getelementptr inbounds float, float addrspace(1)* %0, i64 720
  %1815 = load float, float addrspace(1)* %1814, align 4, !tbaa !9
  %1816 = fmul contract float %1815, 5.000000e-01
  %1817 = fcmp contract olt float %1816, 0.000000e+00
  %1818 = select i1 %1817, float 0x3FA1111120000000, float %1816
  store float %1818, float addrspace(1)* %1814, align 4, !tbaa !9
  %1819 = getelementptr inbounds float, float addrspace(1)* %0, i64 24
  store float %1818, float addrspace(1)* %1819, align 4, !tbaa !9
  %1820 = getelementptr inbounds float, float addrspace(1)* %0, i64 721
  %1821 = load float, float addrspace(1)* %1820, align 4, !tbaa !9
  %1822 = fmul contract float %1821, 5.000000e-01
  %1823 = fcmp contract olt float %1822, 0.000000e+00
  %1824 = select i1 %1823, float 0x3FA1111120000000, float %1822
  store float %1824, float addrspace(1)* %1820, align 4, !tbaa !9
  %1825 = getelementptr inbounds float, float addrspace(1)* %0, i64 54
  store float %1824, float addrspace(1)* %1825, align 4, !tbaa !9
  %1826 = getelementptr inbounds float, float addrspace(1)* %0, i64 722
  %1827 = load float, float addrspace(1)* %1826, align 4, !tbaa !9
  %1828 = fmul contract float %1827, 5.000000e-01
  %1829 = fcmp contract olt float %1828, 0.000000e+00
  %1830 = select i1 %1829, float 0x3FA1111120000000, float %1828
  store float %1830, float addrspace(1)* %1826, align 4, !tbaa !9
  %1831 = getelementptr inbounds float, float addrspace(1)* %0, i64 84
  store float %1830, float addrspace(1)* %1831, align 4, !tbaa !9
  %1832 = getelementptr inbounds float, float addrspace(1)* %0, i64 723
  %1833 = load float, float addrspace(1)* %1832, align 4, !tbaa !9
  %1834 = fmul contract float %1833, 5.000000e-01
  %1835 = fcmp contract olt float %1834, 0.000000e+00
  %1836 = select i1 %1835, float 0x3FA1111120000000, float %1834
  store float %1836, float addrspace(1)* %1832, align 4, !tbaa !9
  %1837 = getelementptr inbounds float, float addrspace(1)* %0, i64 114
  store float %1836, float addrspace(1)* %1837, align 4, !tbaa !9
  %1838 = getelementptr inbounds float, float addrspace(1)* %0, i64 724
  %1839 = load float, float addrspace(1)* %1838, align 4, !tbaa !9
  %1840 = fmul contract float %1839, 5.000000e-01
  %1841 = fcmp contract olt float %1840, 0.000000e+00
  %1842 = select i1 %1841, float 0x3FA1111120000000, float %1840
  store float %1842, float addrspace(1)* %1838, align 4, !tbaa !9
  %1843 = getelementptr inbounds float, float addrspace(1)* %0, i64 144
  store float %1842, float addrspace(1)* %1843, align 4, !tbaa !9
  %1844 = getelementptr inbounds float, float addrspace(1)* %0, i64 725
  %1845 = load float, float addrspace(1)* %1844, align 4, !tbaa !9
  %1846 = fmul contract float %1845, 5.000000e-01
  %1847 = fcmp contract olt float %1846, 0.000000e+00
  %1848 = select i1 %1847, float 0x3FA1111120000000, float %1846
  store float %1848, float addrspace(1)* %1844, align 4, !tbaa !9
  %1849 = getelementptr inbounds float, float addrspace(1)* %0, i64 174
  store float %1848, float addrspace(1)* %1849, align 4, !tbaa !9
  %1850 = getelementptr inbounds float, float addrspace(1)* %0, i64 726
  %1851 = load float, float addrspace(1)* %1850, align 4, !tbaa !9
  %1852 = fmul contract float %1851, 5.000000e-01
  %1853 = fcmp contract olt float %1852, 0.000000e+00
  %1854 = select i1 %1853, float 0x3FA1111120000000, float %1852
  store float %1854, float addrspace(1)* %1850, align 4, !tbaa !9
  %1855 = getelementptr inbounds float, float addrspace(1)* %0, i64 204
  store float %1854, float addrspace(1)* %1855, align 4, !tbaa !9
  %1856 = getelementptr inbounds float, float addrspace(1)* %0, i64 727
  %1857 = load float, float addrspace(1)* %1856, align 4, !tbaa !9
  %1858 = fmul contract float %1857, 5.000000e-01
  %1859 = fcmp contract olt float %1858, 0.000000e+00
  %1860 = select i1 %1859, float 0x3FA1111120000000, float %1858
  store float %1860, float addrspace(1)* %1856, align 4, !tbaa !9
  %1861 = getelementptr inbounds float, float addrspace(1)* %0, i64 234
  store float %1860, float addrspace(1)* %1861, align 4, !tbaa !9
  %1862 = getelementptr inbounds float, float addrspace(1)* %0, i64 728
  %1863 = load float, float addrspace(1)* %1862, align 4, !tbaa !9
  %1864 = fmul contract float %1863, 5.000000e-01
  %1865 = fcmp contract olt float %1864, 0.000000e+00
  %1866 = select i1 %1865, float 0x3FA1111120000000, float %1864
  store float %1866, float addrspace(1)* %1862, align 4, !tbaa !9
  %1867 = getelementptr inbounds float, float addrspace(1)* %0, i64 264
  store float %1866, float addrspace(1)* %1867, align 4, !tbaa !9
  %1868 = getelementptr inbounds float, float addrspace(1)* %0, i64 729
  %1869 = load float, float addrspace(1)* %1868, align 4, !tbaa !9
  %1870 = fmul contract float %1869, 5.000000e-01
  %1871 = fcmp contract olt float %1870, 0.000000e+00
  %1872 = select i1 %1871, float 0x3FA1111120000000, float %1870
  store float %1872, float addrspace(1)* %1868, align 4, !tbaa !9
  %1873 = getelementptr inbounds float, float addrspace(1)* %0, i64 294
  store float %1872, float addrspace(1)* %1873, align 4, !tbaa !9
  %1874 = getelementptr inbounds float, float addrspace(1)* %0, i64 730
  %1875 = load float, float addrspace(1)* %1874, align 4, !tbaa !9
  %1876 = fmul contract float %1875, 5.000000e-01
  %1877 = fcmp contract olt float %1876, 0.000000e+00
  %1878 = select i1 %1877, float 0x3FA1111120000000, float %1876
  store float %1878, float addrspace(1)* %1874, align 4, !tbaa !9
  %1879 = getelementptr inbounds float, float addrspace(1)* %0, i64 324
  store float %1878, float addrspace(1)* %1879, align 4, !tbaa !9
  %1880 = getelementptr inbounds float, float addrspace(1)* %0, i64 731
  %1881 = load float, float addrspace(1)* %1880, align 4, !tbaa !9
  %1882 = fmul contract float %1881, 5.000000e-01
  %1883 = fcmp contract olt float %1882, 0.000000e+00
  %1884 = select i1 %1883, float 0x3FA1111120000000, float %1882
  store float %1884, float addrspace(1)* %1880, align 4, !tbaa !9
  %1885 = getelementptr inbounds float, float addrspace(1)* %0, i64 354
  store float %1884, float addrspace(1)* %1885, align 4, !tbaa !9
  %1886 = getelementptr inbounds float, float addrspace(1)* %0, i64 732
  %1887 = load float, float addrspace(1)* %1886, align 4, !tbaa !9
  %1888 = fmul contract float %1887, 5.000000e-01
  %1889 = fcmp contract olt float %1888, 0.000000e+00
  %1890 = select i1 %1889, float 0x3FA1111120000000, float %1888
  store float %1890, float addrspace(1)* %1886, align 4, !tbaa !9
  %1891 = getelementptr inbounds float, float addrspace(1)* %0, i64 384
  store float %1890, float addrspace(1)* %1891, align 4, !tbaa !9
  %1892 = getelementptr inbounds float, float addrspace(1)* %0, i64 733
  %1893 = load float, float addrspace(1)* %1892, align 4, !tbaa !9
  %1894 = fmul contract float %1893, 5.000000e-01
  %1895 = fcmp contract olt float %1894, 0.000000e+00
  %1896 = select i1 %1895, float 0x3FA1111120000000, float %1894
  store float %1896, float addrspace(1)* %1892, align 4, !tbaa !9
  %1897 = getelementptr inbounds float, float addrspace(1)* %0, i64 414
  store float %1896, float addrspace(1)* %1897, align 4, !tbaa !9
  %1898 = getelementptr inbounds float, float addrspace(1)* %0, i64 734
  %1899 = load float, float addrspace(1)* %1898, align 4, !tbaa !9
  %1900 = fmul contract float %1899, 5.000000e-01
  %1901 = fcmp contract olt float %1900, 0.000000e+00
  %1902 = select i1 %1901, float 0x3FA1111120000000, float %1900
  store float %1902, float addrspace(1)* %1898, align 4, !tbaa !9
  %1903 = getelementptr inbounds float, float addrspace(1)* %0, i64 444
  store float %1902, float addrspace(1)* %1903, align 4, !tbaa !9
  %1904 = getelementptr inbounds float, float addrspace(1)* %0, i64 735
  %1905 = load float, float addrspace(1)* %1904, align 4, !tbaa !9
  %1906 = fmul contract float %1905, 5.000000e-01
  %1907 = fcmp contract olt float %1906, 0.000000e+00
  %1908 = select i1 %1907, float 0x3FA1111120000000, float %1906
  store float %1908, float addrspace(1)* %1904, align 4, !tbaa !9
  %1909 = getelementptr inbounds float, float addrspace(1)* %0, i64 474
  store float %1908, float addrspace(1)* %1909, align 4, !tbaa !9
  %1910 = getelementptr inbounds float, float addrspace(1)* %0, i64 736
  %1911 = load float, float addrspace(1)* %1910, align 4, !tbaa !9
  %1912 = fmul contract float %1911, 5.000000e-01
  %1913 = fcmp contract olt float %1912, 0.000000e+00
  %1914 = select i1 %1913, float 0x3FA1111120000000, float %1912
  store float %1914, float addrspace(1)* %1910, align 4, !tbaa !9
  %1915 = getelementptr inbounds float, float addrspace(1)* %0, i64 504
  store float %1914, float addrspace(1)* %1915, align 4, !tbaa !9
  %1916 = getelementptr inbounds float, float addrspace(1)* %0, i64 737
  %1917 = load float, float addrspace(1)* %1916, align 4, !tbaa !9
  %1918 = fmul contract float %1917, 5.000000e-01
  %1919 = fcmp contract olt float %1918, 0.000000e+00
  %1920 = select i1 %1919, float 0x3FA1111120000000, float %1918
  store float %1920, float addrspace(1)* %1916, align 4, !tbaa !9
  %1921 = getelementptr inbounds float, float addrspace(1)* %0, i64 534
  store float %1920, float addrspace(1)* %1921, align 4, !tbaa !9
  %1922 = getelementptr inbounds float, float addrspace(1)* %0, i64 738
  %1923 = load float, float addrspace(1)* %1922, align 4, !tbaa !9
  %1924 = fmul contract float %1923, 5.000000e-01
  %1925 = fcmp contract olt float %1924, 0.000000e+00
  %1926 = select i1 %1925, float 0x3FA1111120000000, float %1924
  store float %1926, float addrspace(1)* %1922, align 4, !tbaa !9
  %1927 = getelementptr inbounds float, float addrspace(1)* %0, i64 564
  store float %1926, float addrspace(1)* %1927, align 4, !tbaa !9
  %1928 = getelementptr inbounds float, float addrspace(1)* %0, i64 739
  %1929 = load float, float addrspace(1)* %1928, align 4, !tbaa !9
  %1930 = fmul contract float %1929, 5.000000e-01
  %1931 = fcmp contract olt float %1930, 0.000000e+00
  %1932 = select i1 %1931, float 0x3FA1111120000000, float %1930
  store float %1932, float addrspace(1)* %1928, align 4, !tbaa !9
  %1933 = getelementptr inbounds float, float addrspace(1)* %0, i64 594
  store float %1932, float addrspace(1)* %1933, align 4, !tbaa !9
  %1934 = getelementptr inbounds float, float addrspace(1)* %0, i64 740
  %1935 = load float, float addrspace(1)* %1934, align 4, !tbaa !9
  %1936 = fmul contract float %1935, 5.000000e-01
  %1937 = fcmp contract olt float %1936, 0.000000e+00
  %1938 = select i1 %1937, float 0x3FA1111120000000, float %1936
  store float %1938, float addrspace(1)* %1934, align 4, !tbaa !9
  %1939 = getelementptr inbounds float, float addrspace(1)* %0, i64 624
  store float %1938, float addrspace(1)* %1939, align 4, !tbaa !9
  %1940 = getelementptr inbounds float, float addrspace(1)* %0, i64 741
  %1941 = load float, float addrspace(1)* %1940, align 4, !tbaa !9
  %1942 = fmul contract float %1941, 5.000000e-01
  %1943 = fcmp contract olt float %1942, 0.000000e+00
  %1944 = select i1 %1943, float 0x3FA1111120000000, float %1942
  store float %1944, float addrspace(1)* %1940, align 4, !tbaa !9
  %1945 = getelementptr inbounds float, float addrspace(1)* %0, i64 654
  store float %1944, float addrspace(1)* %1945, align 4, !tbaa !9
  %1946 = getelementptr inbounds float, float addrspace(1)* %0, i64 742
  %1947 = load float, float addrspace(1)* %1946, align 4, !tbaa !9
  %1948 = fmul contract float %1947, 5.000000e-01
  %1949 = fcmp contract olt float %1948, 0.000000e+00
  %1950 = select i1 %1949, float 0x3FA1111120000000, float %1948
  store float %1950, float addrspace(1)* %1946, align 4, !tbaa !9
  %1951 = getelementptr inbounds float, float addrspace(1)* %0, i64 684
  store float %1950, float addrspace(1)* %1951, align 4, !tbaa !9
  %1952 = getelementptr inbounds float, float addrspace(1)* %0, i64 743
  %1953 = load float, float addrspace(1)* %1952, align 4, !tbaa !9
  %1954 = fmul contract float %1953, 5.000000e-01
  %1955 = fcmp contract olt float %1954, 0.000000e+00
  %1956 = select i1 %1955, float 0x3FA1111120000000, float %1954
  store float %1956, float addrspace(1)* %1952, align 4, !tbaa !9
  %1957 = getelementptr inbounds float, float addrspace(1)* %0, i64 714
  store float %1956, float addrspace(1)* %1957, align 4, !tbaa !9
  %1958 = getelementptr inbounds float, float addrspace(1)* %0, i64 750
  %1959 = load float, float addrspace(1)* %1958, align 4, !tbaa !9
  %1960 = fmul contract float %1959, 5.000000e-01
  %1961 = fcmp contract olt float %1960, 0.000000e+00
  %1962 = select i1 %1961, float 0x3FA1111120000000, float %1960
  store float %1962, float addrspace(1)* %1958, align 4, !tbaa !9
  %1963 = getelementptr inbounds float, float addrspace(1)* %0, i64 25
  store float %1962, float addrspace(1)* %1963, align 4, !tbaa !9
  %1964 = getelementptr inbounds float, float addrspace(1)* %0, i64 751
  %1965 = load float, float addrspace(1)* %1964, align 4, !tbaa !9
  %1966 = fmul contract float %1965, 5.000000e-01
  %1967 = fcmp contract olt float %1966, 0.000000e+00
  %1968 = select i1 %1967, float 0x3FA1111120000000, float %1966
  store float %1968, float addrspace(1)* %1964, align 4, !tbaa !9
  %1969 = getelementptr inbounds float, float addrspace(1)* %0, i64 55
  store float %1968, float addrspace(1)* %1969, align 4, !tbaa !9
  %1970 = getelementptr inbounds float, float addrspace(1)* %0, i64 752
  %1971 = load float, float addrspace(1)* %1970, align 4, !tbaa !9
  %1972 = fmul contract float %1971, 5.000000e-01
  %1973 = fcmp contract olt float %1972, 0.000000e+00
  %1974 = select i1 %1973, float 0x3FA1111120000000, float %1972
  store float %1974, float addrspace(1)* %1970, align 4, !tbaa !9
  %1975 = getelementptr inbounds float, float addrspace(1)* %0, i64 85
  store float %1974, float addrspace(1)* %1975, align 4, !tbaa !9
  %1976 = getelementptr inbounds float, float addrspace(1)* %0, i64 753
  %1977 = load float, float addrspace(1)* %1976, align 4, !tbaa !9
  %1978 = fmul contract float %1977, 5.000000e-01
  %1979 = fcmp contract olt float %1978, 0.000000e+00
  %1980 = select i1 %1979, float 0x3FA1111120000000, float %1978
  store float %1980, float addrspace(1)* %1976, align 4, !tbaa !9
  %1981 = getelementptr inbounds float, float addrspace(1)* %0, i64 115
  store float %1980, float addrspace(1)* %1981, align 4, !tbaa !9
  %1982 = getelementptr inbounds float, float addrspace(1)* %0, i64 754
  %1983 = load float, float addrspace(1)* %1982, align 4, !tbaa !9
  %1984 = fmul contract float %1983, 5.000000e-01
  %1985 = fcmp contract olt float %1984, 0.000000e+00
  %1986 = select i1 %1985, float 0x3FA1111120000000, float %1984
  store float %1986, float addrspace(1)* %1982, align 4, !tbaa !9
  %1987 = getelementptr inbounds float, float addrspace(1)* %0, i64 145
  store float %1986, float addrspace(1)* %1987, align 4, !tbaa !9
  %1988 = getelementptr inbounds float, float addrspace(1)* %0, i64 755
  %1989 = load float, float addrspace(1)* %1988, align 4, !tbaa !9
  %1990 = fmul contract float %1989, 5.000000e-01
  %1991 = fcmp contract olt float %1990, 0.000000e+00
  %1992 = select i1 %1991, float 0x3FA1111120000000, float %1990
  store float %1992, float addrspace(1)* %1988, align 4, !tbaa !9
  %1993 = getelementptr inbounds float, float addrspace(1)* %0, i64 175
  store float %1992, float addrspace(1)* %1993, align 4, !tbaa !9
  %1994 = getelementptr inbounds float, float addrspace(1)* %0, i64 756
  %1995 = load float, float addrspace(1)* %1994, align 4, !tbaa !9
  %1996 = fmul contract float %1995, 5.000000e-01
  %1997 = fcmp contract olt float %1996, 0.000000e+00
  %1998 = select i1 %1997, float 0x3FA1111120000000, float %1996
  store float %1998, float addrspace(1)* %1994, align 4, !tbaa !9
  %1999 = getelementptr inbounds float, float addrspace(1)* %0, i64 205
  store float %1998, float addrspace(1)* %1999, align 4, !tbaa !9
  %2000 = getelementptr inbounds float, float addrspace(1)* %0, i64 757
  %2001 = load float, float addrspace(1)* %2000, align 4, !tbaa !9
  %2002 = fmul contract float %2001, 5.000000e-01
  %2003 = fcmp contract olt float %2002, 0.000000e+00
  %2004 = select i1 %2003, float 0x3FA1111120000000, float %2002
  store float %2004, float addrspace(1)* %2000, align 4, !tbaa !9
  %2005 = getelementptr inbounds float, float addrspace(1)* %0, i64 235
  store float %2004, float addrspace(1)* %2005, align 4, !tbaa !9
  %2006 = getelementptr inbounds float, float addrspace(1)* %0, i64 758
  %2007 = load float, float addrspace(1)* %2006, align 4, !tbaa !9
  %2008 = fmul contract float %2007, 5.000000e-01
  %2009 = fcmp contract olt float %2008, 0.000000e+00
  %2010 = select i1 %2009, float 0x3FA1111120000000, float %2008
  store float %2010, float addrspace(1)* %2006, align 4, !tbaa !9
  %2011 = getelementptr inbounds float, float addrspace(1)* %0, i64 265
  store float %2010, float addrspace(1)* %2011, align 4, !tbaa !9
  %2012 = getelementptr inbounds float, float addrspace(1)* %0, i64 759
  %2013 = load float, float addrspace(1)* %2012, align 4, !tbaa !9
  %2014 = fmul contract float %2013, 5.000000e-01
  %2015 = fcmp contract olt float %2014, 0.000000e+00
  %2016 = select i1 %2015, float 0x3FA1111120000000, float %2014
  store float %2016, float addrspace(1)* %2012, align 4, !tbaa !9
  %2017 = getelementptr inbounds float, float addrspace(1)* %0, i64 295
  store float %2016, float addrspace(1)* %2017, align 4, !tbaa !9
  %2018 = getelementptr inbounds float, float addrspace(1)* %0, i64 760
  %2019 = load float, float addrspace(1)* %2018, align 4, !tbaa !9
  %2020 = fmul contract float %2019, 5.000000e-01
  %2021 = fcmp contract olt float %2020, 0.000000e+00
  %2022 = select i1 %2021, float 0x3FA1111120000000, float %2020
  store float %2022, float addrspace(1)* %2018, align 4, !tbaa !9
  %2023 = getelementptr inbounds float, float addrspace(1)* %0, i64 325
  store float %2022, float addrspace(1)* %2023, align 4, !tbaa !9
  %2024 = getelementptr inbounds float, float addrspace(1)* %0, i64 761
  %2025 = load float, float addrspace(1)* %2024, align 4, !tbaa !9
  %2026 = fmul contract float %2025, 5.000000e-01
  %2027 = fcmp contract olt float %2026, 0.000000e+00
  %2028 = select i1 %2027, float 0x3FA1111120000000, float %2026
  store float %2028, float addrspace(1)* %2024, align 4, !tbaa !9
  %2029 = getelementptr inbounds float, float addrspace(1)* %0, i64 355
  store float %2028, float addrspace(1)* %2029, align 4, !tbaa !9
  %2030 = getelementptr inbounds float, float addrspace(1)* %0, i64 762
  %2031 = load float, float addrspace(1)* %2030, align 4, !tbaa !9
  %2032 = fmul contract float %2031, 5.000000e-01
  %2033 = fcmp contract olt float %2032, 0.000000e+00
  %2034 = select i1 %2033, float 0x3FA1111120000000, float %2032
  store float %2034, float addrspace(1)* %2030, align 4, !tbaa !9
  %2035 = getelementptr inbounds float, float addrspace(1)* %0, i64 385
  store float %2034, float addrspace(1)* %2035, align 4, !tbaa !9
  %2036 = getelementptr inbounds float, float addrspace(1)* %0, i64 763
  %2037 = load float, float addrspace(1)* %2036, align 4, !tbaa !9
  %2038 = fmul contract float %2037, 5.000000e-01
  %2039 = fcmp contract olt float %2038, 0.000000e+00
  %2040 = select i1 %2039, float 0x3FA1111120000000, float %2038
  store float %2040, float addrspace(1)* %2036, align 4, !tbaa !9
  %2041 = getelementptr inbounds float, float addrspace(1)* %0, i64 415
  store float %2040, float addrspace(1)* %2041, align 4, !tbaa !9
  %2042 = getelementptr inbounds float, float addrspace(1)* %0, i64 764
  %2043 = load float, float addrspace(1)* %2042, align 4, !tbaa !9
  %2044 = fmul contract float %2043, 5.000000e-01
  %2045 = fcmp contract olt float %2044, 0.000000e+00
  %2046 = select i1 %2045, float 0x3FA1111120000000, float %2044
  store float %2046, float addrspace(1)* %2042, align 4, !tbaa !9
  %2047 = getelementptr inbounds float, float addrspace(1)* %0, i64 445
  store float %2046, float addrspace(1)* %2047, align 4, !tbaa !9
  %2048 = getelementptr inbounds float, float addrspace(1)* %0, i64 765
  %2049 = load float, float addrspace(1)* %2048, align 4, !tbaa !9
  %2050 = fmul contract float %2049, 5.000000e-01
  %2051 = fcmp contract olt float %2050, 0.000000e+00
  %2052 = select i1 %2051, float 0x3FA1111120000000, float %2050
  store float %2052, float addrspace(1)* %2048, align 4, !tbaa !9
  %2053 = getelementptr inbounds float, float addrspace(1)* %0, i64 475
  store float %2052, float addrspace(1)* %2053, align 4, !tbaa !9
  %2054 = getelementptr inbounds float, float addrspace(1)* %0, i64 766
  %2055 = load float, float addrspace(1)* %2054, align 4, !tbaa !9
  %2056 = fmul contract float %2055, 5.000000e-01
  %2057 = fcmp contract olt float %2056, 0.000000e+00
  %2058 = select i1 %2057, float 0x3FA1111120000000, float %2056
  store float %2058, float addrspace(1)* %2054, align 4, !tbaa !9
  %2059 = getelementptr inbounds float, float addrspace(1)* %0, i64 505
  store float %2058, float addrspace(1)* %2059, align 4, !tbaa !9
  %2060 = getelementptr inbounds float, float addrspace(1)* %0, i64 767
  %2061 = load float, float addrspace(1)* %2060, align 4, !tbaa !9
  %2062 = fmul contract float %2061, 5.000000e-01
  %2063 = fcmp contract olt float %2062, 0.000000e+00
  %2064 = select i1 %2063, float 0x3FA1111120000000, float %2062
  store float %2064, float addrspace(1)* %2060, align 4, !tbaa !9
  %2065 = getelementptr inbounds float, float addrspace(1)* %0, i64 535
  store float %2064, float addrspace(1)* %2065, align 4, !tbaa !9
  %2066 = getelementptr inbounds float, float addrspace(1)* %0, i64 768
  %2067 = load float, float addrspace(1)* %2066, align 4, !tbaa !9
  %2068 = fmul contract float %2067, 5.000000e-01
  %2069 = fcmp contract olt float %2068, 0.000000e+00
  %2070 = select i1 %2069, float 0x3FA1111120000000, float %2068
  store float %2070, float addrspace(1)* %2066, align 4, !tbaa !9
  %2071 = getelementptr inbounds float, float addrspace(1)* %0, i64 565
  store float %2070, float addrspace(1)* %2071, align 4, !tbaa !9
  %2072 = getelementptr inbounds float, float addrspace(1)* %0, i64 769
  %2073 = load float, float addrspace(1)* %2072, align 4, !tbaa !9
  %2074 = fmul contract float %2073, 5.000000e-01
  %2075 = fcmp contract olt float %2074, 0.000000e+00
  %2076 = select i1 %2075, float 0x3FA1111120000000, float %2074
  store float %2076, float addrspace(1)* %2072, align 4, !tbaa !9
  %2077 = getelementptr inbounds float, float addrspace(1)* %0, i64 595
  store float %2076, float addrspace(1)* %2077, align 4, !tbaa !9
  %2078 = getelementptr inbounds float, float addrspace(1)* %0, i64 770
  %2079 = load float, float addrspace(1)* %2078, align 4, !tbaa !9
  %2080 = fmul contract float %2079, 5.000000e-01
  %2081 = fcmp contract olt float %2080, 0.000000e+00
  %2082 = select i1 %2081, float 0x3FA1111120000000, float %2080
  store float %2082, float addrspace(1)* %2078, align 4, !tbaa !9
  %2083 = getelementptr inbounds float, float addrspace(1)* %0, i64 625
  store float %2082, float addrspace(1)* %2083, align 4, !tbaa !9
  %2084 = getelementptr inbounds float, float addrspace(1)* %0, i64 771
  %2085 = load float, float addrspace(1)* %2084, align 4, !tbaa !9
  %2086 = fmul contract float %2085, 5.000000e-01
  %2087 = fcmp contract olt float %2086, 0.000000e+00
  %2088 = select i1 %2087, float 0x3FA1111120000000, float %2086
  store float %2088, float addrspace(1)* %2084, align 4, !tbaa !9
  %2089 = getelementptr inbounds float, float addrspace(1)* %0, i64 655
  store float %2088, float addrspace(1)* %2089, align 4, !tbaa !9
  %2090 = getelementptr inbounds float, float addrspace(1)* %0, i64 772
  %2091 = load float, float addrspace(1)* %2090, align 4, !tbaa !9
  %2092 = fmul contract float %2091, 5.000000e-01
  %2093 = fcmp contract olt float %2092, 0.000000e+00
  %2094 = select i1 %2093, float 0x3FA1111120000000, float %2092
  store float %2094, float addrspace(1)* %2090, align 4, !tbaa !9
  %2095 = getelementptr inbounds float, float addrspace(1)* %0, i64 685
  store float %2094, float addrspace(1)* %2095, align 4, !tbaa !9
  %2096 = getelementptr inbounds float, float addrspace(1)* %0, i64 773
  %2097 = load float, float addrspace(1)* %2096, align 4, !tbaa !9
  %2098 = fmul contract float %2097, 5.000000e-01
  %2099 = fcmp contract olt float %2098, 0.000000e+00
  %2100 = select i1 %2099, float 0x3FA1111120000000, float %2098
  store float %2100, float addrspace(1)* %2096, align 4, !tbaa !9
  %2101 = getelementptr inbounds float, float addrspace(1)* %0, i64 715
  store float %2100, float addrspace(1)* %2101, align 4, !tbaa !9
  %2102 = getelementptr inbounds float, float addrspace(1)* %0, i64 774
  %2103 = load float, float addrspace(1)* %2102, align 4, !tbaa !9
  %2104 = fmul contract float %2103, 5.000000e-01
  %2105 = fcmp contract olt float %2104, 0.000000e+00
  %2106 = select i1 %2105, float 0x3FA1111120000000, float %2104
  store float %2106, float addrspace(1)* %2102, align 4, !tbaa !9
  %2107 = getelementptr inbounds float, float addrspace(1)* %0, i64 745
  store float %2106, float addrspace(1)* %2107, align 4, !tbaa !9
  %2108 = getelementptr inbounds float, float addrspace(1)* %0, i64 780
  %2109 = load float, float addrspace(1)* %2108, align 4, !tbaa !9
  %2110 = fmul contract float %2109, 5.000000e-01
  %2111 = fcmp contract olt float %2110, 0.000000e+00
  %2112 = select i1 %2111, float 0x3FA1111120000000, float %2110
  store float %2112, float addrspace(1)* %2108, align 4, !tbaa !9
  %2113 = getelementptr inbounds float, float addrspace(1)* %0, i64 26
  store float %2112, float addrspace(1)* %2113, align 4, !tbaa !9
  %2114 = getelementptr inbounds float, float addrspace(1)* %0, i64 781
  %2115 = load float, float addrspace(1)* %2114, align 4, !tbaa !9
  %2116 = fmul contract float %2115, 5.000000e-01
  %2117 = fcmp contract olt float %2116, 0.000000e+00
  %2118 = select i1 %2117, float 0x3FA1111120000000, float %2116
  store float %2118, float addrspace(1)* %2114, align 4, !tbaa !9
  %2119 = getelementptr inbounds float, float addrspace(1)* %0, i64 56
  store float %2118, float addrspace(1)* %2119, align 4, !tbaa !9
  %2120 = getelementptr inbounds float, float addrspace(1)* %0, i64 782
  %2121 = load float, float addrspace(1)* %2120, align 4, !tbaa !9
  %2122 = fmul contract float %2121, 5.000000e-01
  %2123 = fcmp contract olt float %2122, 0.000000e+00
  %2124 = select i1 %2123, float 0x3FA1111120000000, float %2122
  store float %2124, float addrspace(1)* %2120, align 4, !tbaa !9
  %2125 = getelementptr inbounds float, float addrspace(1)* %0, i64 86
  store float %2124, float addrspace(1)* %2125, align 4, !tbaa !9
  %2126 = getelementptr inbounds float, float addrspace(1)* %0, i64 783
  %2127 = load float, float addrspace(1)* %2126, align 4, !tbaa !9
  %2128 = fmul contract float %2127, 5.000000e-01
  %2129 = fcmp contract olt float %2128, 0.000000e+00
  %2130 = select i1 %2129, float 0x3FA1111120000000, float %2128
  store float %2130, float addrspace(1)* %2126, align 4, !tbaa !9
  %2131 = getelementptr inbounds float, float addrspace(1)* %0, i64 116
  store float %2130, float addrspace(1)* %2131, align 4, !tbaa !9
  %2132 = getelementptr inbounds float, float addrspace(1)* %0, i64 784
  %2133 = load float, float addrspace(1)* %2132, align 4, !tbaa !9
  %2134 = fmul contract float %2133, 5.000000e-01
  %2135 = fcmp contract olt float %2134, 0.000000e+00
  %2136 = select i1 %2135, float 0x3FA1111120000000, float %2134
  store float %2136, float addrspace(1)* %2132, align 4, !tbaa !9
  %2137 = getelementptr inbounds float, float addrspace(1)* %0, i64 146
  store float %2136, float addrspace(1)* %2137, align 4, !tbaa !9
  %2138 = getelementptr inbounds float, float addrspace(1)* %0, i64 785
  %2139 = load float, float addrspace(1)* %2138, align 4, !tbaa !9
  %2140 = fmul contract float %2139, 5.000000e-01
  %2141 = fcmp contract olt float %2140, 0.000000e+00
  %2142 = select i1 %2141, float 0x3FA1111120000000, float %2140
  store float %2142, float addrspace(1)* %2138, align 4, !tbaa !9
  %2143 = getelementptr inbounds float, float addrspace(1)* %0, i64 176
  store float %2142, float addrspace(1)* %2143, align 4, !tbaa !9
  %2144 = getelementptr inbounds float, float addrspace(1)* %0, i64 786
  %2145 = load float, float addrspace(1)* %2144, align 4, !tbaa !9
  %2146 = fmul contract float %2145, 5.000000e-01
  %2147 = fcmp contract olt float %2146, 0.000000e+00
  %2148 = select i1 %2147, float 0x3FA1111120000000, float %2146
  store float %2148, float addrspace(1)* %2144, align 4, !tbaa !9
  %2149 = getelementptr inbounds float, float addrspace(1)* %0, i64 206
  store float %2148, float addrspace(1)* %2149, align 4, !tbaa !9
  %2150 = getelementptr inbounds float, float addrspace(1)* %0, i64 787
  %2151 = load float, float addrspace(1)* %2150, align 4, !tbaa !9
  %2152 = fmul contract float %2151, 5.000000e-01
  %2153 = fcmp contract olt float %2152, 0.000000e+00
  %2154 = select i1 %2153, float 0x3FA1111120000000, float %2152
  store float %2154, float addrspace(1)* %2150, align 4, !tbaa !9
  %2155 = getelementptr inbounds float, float addrspace(1)* %0, i64 236
  store float %2154, float addrspace(1)* %2155, align 4, !tbaa !9
  %2156 = getelementptr inbounds float, float addrspace(1)* %0, i64 788
  %2157 = load float, float addrspace(1)* %2156, align 4, !tbaa !9
  %2158 = fmul contract float %2157, 5.000000e-01
  %2159 = fcmp contract olt float %2158, 0.000000e+00
  %2160 = select i1 %2159, float 0x3FA1111120000000, float %2158
  store float %2160, float addrspace(1)* %2156, align 4, !tbaa !9
  %2161 = getelementptr inbounds float, float addrspace(1)* %0, i64 266
  store float %2160, float addrspace(1)* %2161, align 4, !tbaa !9
  %2162 = getelementptr inbounds float, float addrspace(1)* %0, i64 789
  %2163 = load float, float addrspace(1)* %2162, align 4, !tbaa !9
  %2164 = fmul contract float %2163, 5.000000e-01
  %2165 = fcmp contract olt float %2164, 0.000000e+00
  %2166 = select i1 %2165, float 0x3FA1111120000000, float %2164
  store float %2166, float addrspace(1)* %2162, align 4, !tbaa !9
  %2167 = getelementptr inbounds float, float addrspace(1)* %0, i64 296
  store float %2166, float addrspace(1)* %2167, align 4, !tbaa !9
  %2168 = getelementptr inbounds float, float addrspace(1)* %0, i64 790
  %2169 = load float, float addrspace(1)* %2168, align 4, !tbaa !9
  %2170 = fmul contract float %2169, 5.000000e-01
  %2171 = fcmp contract olt float %2170, 0.000000e+00
  %2172 = select i1 %2171, float 0x3FA1111120000000, float %2170
  store float %2172, float addrspace(1)* %2168, align 4, !tbaa !9
  %2173 = getelementptr inbounds float, float addrspace(1)* %0, i64 326
  store float %2172, float addrspace(1)* %2173, align 4, !tbaa !9
  %2174 = getelementptr inbounds float, float addrspace(1)* %0, i64 791
  %2175 = load float, float addrspace(1)* %2174, align 4, !tbaa !9
  %2176 = fmul contract float %2175, 5.000000e-01
  %2177 = fcmp contract olt float %2176, 0.000000e+00
  %2178 = select i1 %2177, float 0x3FA1111120000000, float %2176
  store float %2178, float addrspace(1)* %2174, align 4, !tbaa !9
  %2179 = getelementptr inbounds float, float addrspace(1)* %0, i64 356
  store float %2178, float addrspace(1)* %2179, align 4, !tbaa !9
  %2180 = getelementptr inbounds float, float addrspace(1)* %0, i64 792
  %2181 = load float, float addrspace(1)* %2180, align 4, !tbaa !9
  %2182 = fmul contract float %2181, 5.000000e-01
  %2183 = fcmp contract olt float %2182, 0.000000e+00
  %2184 = select i1 %2183, float 0x3FA1111120000000, float %2182
  store float %2184, float addrspace(1)* %2180, align 4, !tbaa !9
  %2185 = getelementptr inbounds float, float addrspace(1)* %0, i64 386
  store float %2184, float addrspace(1)* %2185, align 4, !tbaa !9
  %2186 = getelementptr inbounds float, float addrspace(1)* %0, i64 793
  %2187 = load float, float addrspace(1)* %2186, align 4, !tbaa !9
  %2188 = fmul contract float %2187, 5.000000e-01
  %2189 = fcmp contract olt float %2188, 0.000000e+00
  %2190 = select i1 %2189, float 0x3FA1111120000000, float %2188
  store float %2190, float addrspace(1)* %2186, align 4, !tbaa !9
  %2191 = getelementptr inbounds float, float addrspace(1)* %0, i64 416
  store float %2190, float addrspace(1)* %2191, align 4, !tbaa !9
  %2192 = getelementptr inbounds float, float addrspace(1)* %0, i64 794
  %2193 = load float, float addrspace(1)* %2192, align 4, !tbaa !9
  %2194 = fmul contract float %2193, 5.000000e-01
  %2195 = fcmp contract olt float %2194, 0.000000e+00
  %2196 = select i1 %2195, float 0x3FA1111120000000, float %2194
  store float %2196, float addrspace(1)* %2192, align 4, !tbaa !9
  %2197 = getelementptr inbounds float, float addrspace(1)* %0, i64 446
  store float %2196, float addrspace(1)* %2197, align 4, !tbaa !9
  %2198 = getelementptr inbounds float, float addrspace(1)* %0, i64 795
  %2199 = load float, float addrspace(1)* %2198, align 4, !tbaa !9
  %2200 = fmul contract float %2199, 5.000000e-01
  %2201 = fcmp contract olt float %2200, 0.000000e+00
  %2202 = select i1 %2201, float 0x3FA1111120000000, float %2200
  store float %2202, float addrspace(1)* %2198, align 4, !tbaa !9
  %2203 = getelementptr inbounds float, float addrspace(1)* %0, i64 476
  store float %2202, float addrspace(1)* %2203, align 4, !tbaa !9
  %2204 = getelementptr inbounds float, float addrspace(1)* %0, i64 796
  %2205 = load float, float addrspace(1)* %2204, align 4, !tbaa !9
  %2206 = fmul contract float %2205, 5.000000e-01
  %2207 = fcmp contract olt float %2206, 0.000000e+00
  %2208 = select i1 %2207, float 0x3FA1111120000000, float %2206
  store float %2208, float addrspace(1)* %2204, align 4, !tbaa !9
  %2209 = getelementptr inbounds float, float addrspace(1)* %0, i64 506
  store float %2208, float addrspace(1)* %2209, align 4, !tbaa !9
  %2210 = getelementptr inbounds float, float addrspace(1)* %0, i64 797
  %2211 = load float, float addrspace(1)* %2210, align 4, !tbaa !9
  %2212 = fmul contract float %2211, 5.000000e-01
  %2213 = fcmp contract olt float %2212, 0.000000e+00
  %2214 = select i1 %2213, float 0x3FA1111120000000, float %2212
  store float %2214, float addrspace(1)* %2210, align 4, !tbaa !9
  %2215 = getelementptr inbounds float, float addrspace(1)* %0, i64 536
  store float %2214, float addrspace(1)* %2215, align 4, !tbaa !9
  %2216 = getelementptr inbounds float, float addrspace(1)* %0, i64 798
  %2217 = load float, float addrspace(1)* %2216, align 4, !tbaa !9
  %2218 = fmul contract float %2217, 5.000000e-01
  %2219 = fcmp contract olt float %2218, 0.000000e+00
  %2220 = select i1 %2219, float 0x3FA1111120000000, float %2218
  store float %2220, float addrspace(1)* %2216, align 4, !tbaa !9
  %2221 = getelementptr inbounds float, float addrspace(1)* %0, i64 566
  store float %2220, float addrspace(1)* %2221, align 4, !tbaa !9
  %2222 = getelementptr inbounds float, float addrspace(1)* %0, i64 799
  %2223 = load float, float addrspace(1)* %2222, align 4, !tbaa !9
  %2224 = fmul contract float %2223, 5.000000e-01
  %2225 = fcmp contract olt float %2224, 0.000000e+00
  %2226 = select i1 %2225, float 0x3FA1111120000000, float %2224
  store float %2226, float addrspace(1)* %2222, align 4, !tbaa !9
  %2227 = getelementptr inbounds float, float addrspace(1)* %0, i64 596
  store float %2226, float addrspace(1)* %2227, align 4, !tbaa !9
  %2228 = getelementptr inbounds float, float addrspace(1)* %0, i64 800
  %2229 = load float, float addrspace(1)* %2228, align 4, !tbaa !9
  %2230 = fmul contract float %2229, 5.000000e-01
  %2231 = fcmp contract olt float %2230, 0.000000e+00
  %2232 = select i1 %2231, float 0x3FA1111120000000, float %2230
  store float %2232, float addrspace(1)* %2228, align 4, !tbaa !9
  %2233 = getelementptr inbounds float, float addrspace(1)* %0, i64 626
  store float %2232, float addrspace(1)* %2233, align 4, !tbaa !9
  %2234 = getelementptr inbounds float, float addrspace(1)* %0, i64 801
  %2235 = load float, float addrspace(1)* %2234, align 4, !tbaa !9
  %2236 = fmul contract float %2235, 5.000000e-01
  %2237 = fcmp contract olt float %2236, 0.000000e+00
  %2238 = select i1 %2237, float 0x3FA1111120000000, float %2236
  store float %2238, float addrspace(1)* %2234, align 4, !tbaa !9
  %2239 = getelementptr inbounds float, float addrspace(1)* %0, i64 656
  store float %2238, float addrspace(1)* %2239, align 4, !tbaa !9
  %2240 = getelementptr inbounds float, float addrspace(1)* %0, i64 802
  %2241 = load float, float addrspace(1)* %2240, align 4, !tbaa !9
  %2242 = fmul contract float %2241, 5.000000e-01
  %2243 = fcmp contract olt float %2242, 0.000000e+00
  %2244 = select i1 %2243, float 0x3FA1111120000000, float %2242
  store float %2244, float addrspace(1)* %2240, align 4, !tbaa !9
  %2245 = getelementptr inbounds float, float addrspace(1)* %0, i64 686
  store float %2244, float addrspace(1)* %2245, align 4, !tbaa !9
  %2246 = getelementptr inbounds float, float addrspace(1)* %0, i64 803
  %2247 = load float, float addrspace(1)* %2246, align 4, !tbaa !9
  %2248 = fmul contract float %2247, 5.000000e-01
  %2249 = fcmp contract olt float %2248, 0.000000e+00
  %2250 = select i1 %2249, float 0x3FA1111120000000, float %2248
  store float %2250, float addrspace(1)* %2246, align 4, !tbaa !9
  %2251 = getelementptr inbounds float, float addrspace(1)* %0, i64 716
  store float %2250, float addrspace(1)* %2251, align 4, !tbaa !9
  %2252 = getelementptr inbounds float, float addrspace(1)* %0, i64 804
  %2253 = load float, float addrspace(1)* %2252, align 4, !tbaa !9
  %2254 = fmul contract float %2253, 5.000000e-01
  %2255 = fcmp contract olt float %2254, 0.000000e+00
  %2256 = select i1 %2255, float 0x3FA1111120000000, float %2254
  store float %2256, float addrspace(1)* %2252, align 4, !tbaa !9
  %2257 = getelementptr inbounds float, float addrspace(1)* %0, i64 746
  store float %2256, float addrspace(1)* %2257, align 4, !tbaa !9
  %2258 = getelementptr inbounds float, float addrspace(1)* %0, i64 805
  %2259 = load float, float addrspace(1)* %2258, align 4, !tbaa !9
  %2260 = fmul contract float %2259, 5.000000e-01
  %2261 = fcmp contract olt float %2260, 0.000000e+00
  %2262 = select i1 %2261, float 0x3FA1111120000000, float %2260
  store float %2262, float addrspace(1)* %2258, align 4, !tbaa !9
  %2263 = getelementptr inbounds float, float addrspace(1)* %0, i64 776
  store float %2262, float addrspace(1)* %2263, align 4, !tbaa !9
  %2264 = getelementptr inbounds float, float addrspace(1)* %0, i64 810
  %2265 = load float, float addrspace(1)* %2264, align 4, !tbaa !9
  %2266 = fmul contract float %2265, 5.000000e-01
  %2267 = fcmp contract olt float %2266, 0.000000e+00
  %2268 = select i1 %2267, float 0x3FA1111120000000, float %2266
  store float %2268, float addrspace(1)* %2264, align 4, !tbaa !9
  %2269 = getelementptr inbounds float, float addrspace(1)* %0, i64 27
  store float %2268, float addrspace(1)* %2269, align 4, !tbaa !9
  %2270 = getelementptr inbounds float, float addrspace(1)* %0, i64 811
  %2271 = load float, float addrspace(1)* %2270, align 4, !tbaa !9
  %2272 = fmul contract float %2271, 5.000000e-01
  %2273 = fcmp contract olt float %2272, 0.000000e+00
  %2274 = select i1 %2273, float 0x3FA1111120000000, float %2272
  store float %2274, float addrspace(1)* %2270, align 4, !tbaa !9
  %2275 = getelementptr inbounds float, float addrspace(1)* %0, i64 57
  store float %2274, float addrspace(1)* %2275, align 4, !tbaa !9
  %2276 = getelementptr inbounds float, float addrspace(1)* %0, i64 812
  %2277 = load float, float addrspace(1)* %2276, align 4, !tbaa !9
  %2278 = fmul contract float %2277, 5.000000e-01
  %2279 = fcmp contract olt float %2278, 0.000000e+00
  %2280 = select i1 %2279, float 0x3FA1111120000000, float %2278
  store float %2280, float addrspace(1)* %2276, align 4, !tbaa !9
  %2281 = getelementptr inbounds float, float addrspace(1)* %0, i64 87
  store float %2280, float addrspace(1)* %2281, align 4, !tbaa !9
  %2282 = getelementptr inbounds float, float addrspace(1)* %0, i64 813
  %2283 = load float, float addrspace(1)* %2282, align 4, !tbaa !9
  %2284 = fmul contract float %2283, 5.000000e-01
  %2285 = fcmp contract olt float %2284, 0.000000e+00
  %2286 = select i1 %2285, float 0x3FA1111120000000, float %2284
  store float %2286, float addrspace(1)* %2282, align 4, !tbaa !9
  %2287 = getelementptr inbounds float, float addrspace(1)* %0, i64 117
  store float %2286, float addrspace(1)* %2287, align 4, !tbaa !9
  %2288 = getelementptr inbounds float, float addrspace(1)* %0, i64 814
  %2289 = load float, float addrspace(1)* %2288, align 4, !tbaa !9
  %2290 = fmul contract float %2289, 5.000000e-01
  %2291 = fcmp contract olt float %2290, 0.000000e+00
  %2292 = select i1 %2291, float 0x3FA1111120000000, float %2290
  store float %2292, float addrspace(1)* %2288, align 4, !tbaa !9
  %2293 = getelementptr inbounds float, float addrspace(1)* %0, i64 147
  store float %2292, float addrspace(1)* %2293, align 4, !tbaa !9
  %2294 = getelementptr inbounds float, float addrspace(1)* %0, i64 815
  %2295 = load float, float addrspace(1)* %2294, align 4, !tbaa !9
  %2296 = fmul contract float %2295, 5.000000e-01
  %2297 = fcmp contract olt float %2296, 0.000000e+00
  %2298 = select i1 %2297, float 0x3FA1111120000000, float %2296
  store float %2298, float addrspace(1)* %2294, align 4, !tbaa !9
  %2299 = getelementptr inbounds float, float addrspace(1)* %0, i64 177
  store float %2298, float addrspace(1)* %2299, align 4, !tbaa !9
  %2300 = getelementptr inbounds float, float addrspace(1)* %0, i64 816
  %2301 = load float, float addrspace(1)* %2300, align 4, !tbaa !9
  %2302 = fmul contract float %2301, 5.000000e-01
  %2303 = fcmp contract olt float %2302, 0.000000e+00
  %2304 = select i1 %2303, float 0x3FA1111120000000, float %2302
  store float %2304, float addrspace(1)* %2300, align 4, !tbaa !9
  %2305 = getelementptr inbounds float, float addrspace(1)* %0, i64 207
  store float %2304, float addrspace(1)* %2305, align 4, !tbaa !9
  %2306 = getelementptr inbounds float, float addrspace(1)* %0, i64 817
  %2307 = load float, float addrspace(1)* %2306, align 4, !tbaa !9
  %2308 = fmul contract float %2307, 5.000000e-01
  %2309 = fcmp contract olt float %2308, 0.000000e+00
  %2310 = select i1 %2309, float 0x3FA1111120000000, float %2308
  store float %2310, float addrspace(1)* %2306, align 4, !tbaa !9
  %2311 = getelementptr inbounds float, float addrspace(1)* %0, i64 237
  store float %2310, float addrspace(1)* %2311, align 4, !tbaa !9
  %2312 = getelementptr inbounds float, float addrspace(1)* %0, i64 818
  %2313 = load float, float addrspace(1)* %2312, align 4, !tbaa !9
  %2314 = fmul contract float %2313, 5.000000e-01
  %2315 = fcmp contract olt float %2314, 0.000000e+00
  %2316 = select i1 %2315, float 0x3FA1111120000000, float %2314
  store float %2316, float addrspace(1)* %2312, align 4, !tbaa !9
  %2317 = getelementptr inbounds float, float addrspace(1)* %0, i64 267
  store float %2316, float addrspace(1)* %2317, align 4, !tbaa !9
  %2318 = getelementptr inbounds float, float addrspace(1)* %0, i64 819
  %2319 = load float, float addrspace(1)* %2318, align 4, !tbaa !9
  %2320 = fmul contract float %2319, 5.000000e-01
  %2321 = fcmp contract olt float %2320, 0.000000e+00
  %2322 = select i1 %2321, float 0x3FA1111120000000, float %2320
  store float %2322, float addrspace(1)* %2318, align 4, !tbaa !9
  %2323 = getelementptr inbounds float, float addrspace(1)* %0, i64 297
  store float %2322, float addrspace(1)* %2323, align 4, !tbaa !9
  %2324 = getelementptr inbounds float, float addrspace(1)* %0, i64 820
  %2325 = load float, float addrspace(1)* %2324, align 4, !tbaa !9
  %2326 = fmul contract float %2325, 5.000000e-01
  %2327 = fcmp contract olt float %2326, 0.000000e+00
  %2328 = select i1 %2327, float 0x3FA1111120000000, float %2326
  store float %2328, float addrspace(1)* %2324, align 4, !tbaa !9
  %2329 = getelementptr inbounds float, float addrspace(1)* %0, i64 327
  store float %2328, float addrspace(1)* %2329, align 4, !tbaa !9
  %2330 = getelementptr inbounds float, float addrspace(1)* %0, i64 821
  %2331 = load float, float addrspace(1)* %2330, align 4, !tbaa !9
  %2332 = fmul contract float %2331, 5.000000e-01
  %2333 = fcmp contract olt float %2332, 0.000000e+00
  %2334 = select i1 %2333, float 0x3FA1111120000000, float %2332
  store float %2334, float addrspace(1)* %2330, align 4, !tbaa !9
  %2335 = getelementptr inbounds float, float addrspace(1)* %0, i64 357
  store float %2334, float addrspace(1)* %2335, align 4, !tbaa !9
  %2336 = getelementptr inbounds float, float addrspace(1)* %0, i64 822
  %2337 = load float, float addrspace(1)* %2336, align 4, !tbaa !9
  %2338 = fmul contract float %2337, 5.000000e-01
  %2339 = fcmp contract olt float %2338, 0.000000e+00
  %2340 = select i1 %2339, float 0x3FA1111120000000, float %2338
  store float %2340, float addrspace(1)* %2336, align 4, !tbaa !9
  %2341 = getelementptr inbounds float, float addrspace(1)* %0, i64 387
  store float %2340, float addrspace(1)* %2341, align 4, !tbaa !9
  %2342 = getelementptr inbounds float, float addrspace(1)* %0, i64 823
  %2343 = load float, float addrspace(1)* %2342, align 4, !tbaa !9
  %2344 = fmul contract float %2343, 5.000000e-01
  %2345 = fcmp contract olt float %2344, 0.000000e+00
  %2346 = select i1 %2345, float 0x3FA1111120000000, float %2344
  store float %2346, float addrspace(1)* %2342, align 4, !tbaa !9
  %2347 = getelementptr inbounds float, float addrspace(1)* %0, i64 417
  store float %2346, float addrspace(1)* %2347, align 4, !tbaa !9
  %2348 = getelementptr inbounds float, float addrspace(1)* %0, i64 824
  %2349 = load float, float addrspace(1)* %2348, align 4, !tbaa !9
  %2350 = fmul contract float %2349, 5.000000e-01
  %2351 = fcmp contract olt float %2350, 0.000000e+00
  %2352 = select i1 %2351, float 0x3FA1111120000000, float %2350
  store float %2352, float addrspace(1)* %2348, align 4, !tbaa !9
  %2353 = getelementptr inbounds float, float addrspace(1)* %0, i64 447
  store float %2352, float addrspace(1)* %2353, align 4, !tbaa !9
  %2354 = getelementptr inbounds float, float addrspace(1)* %0, i64 825
  %2355 = load float, float addrspace(1)* %2354, align 4, !tbaa !9
  %2356 = fmul contract float %2355, 5.000000e-01
  %2357 = fcmp contract olt float %2356, 0.000000e+00
  %2358 = select i1 %2357, float 0x3FA1111120000000, float %2356
  store float %2358, float addrspace(1)* %2354, align 4, !tbaa !9
  %2359 = getelementptr inbounds float, float addrspace(1)* %0, i64 477
  store float %2358, float addrspace(1)* %2359, align 4, !tbaa !9
  %2360 = getelementptr inbounds float, float addrspace(1)* %0, i64 826
  %2361 = load float, float addrspace(1)* %2360, align 4, !tbaa !9
  %2362 = fmul contract float %2361, 5.000000e-01
  %2363 = fcmp contract olt float %2362, 0.000000e+00
  %2364 = select i1 %2363, float 0x3FA1111120000000, float %2362
  store float %2364, float addrspace(1)* %2360, align 4, !tbaa !9
  %2365 = getelementptr inbounds float, float addrspace(1)* %0, i64 507
  store float %2364, float addrspace(1)* %2365, align 4, !tbaa !9
  %2366 = getelementptr inbounds float, float addrspace(1)* %0, i64 827
  %2367 = load float, float addrspace(1)* %2366, align 4, !tbaa !9
  %2368 = fmul contract float %2367, 5.000000e-01
  %2369 = fcmp contract olt float %2368, 0.000000e+00
  %2370 = select i1 %2369, float 0x3FA1111120000000, float %2368
  store float %2370, float addrspace(1)* %2366, align 4, !tbaa !9
  %2371 = getelementptr inbounds float, float addrspace(1)* %0, i64 537
  store float %2370, float addrspace(1)* %2371, align 4, !tbaa !9
  %2372 = getelementptr inbounds float, float addrspace(1)* %0, i64 828
  %2373 = load float, float addrspace(1)* %2372, align 4, !tbaa !9
  %2374 = fmul contract float %2373, 5.000000e-01
  %2375 = fcmp contract olt float %2374, 0.000000e+00
  %2376 = select i1 %2375, float 0x3FA1111120000000, float %2374
  store float %2376, float addrspace(1)* %2372, align 4, !tbaa !9
  %2377 = getelementptr inbounds float, float addrspace(1)* %0, i64 567
  store float %2376, float addrspace(1)* %2377, align 4, !tbaa !9
  %2378 = getelementptr inbounds float, float addrspace(1)* %0, i64 829
  %2379 = load float, float addrspace(1)* %2378, align 4, !tbaa !9
  %2380 = fmul contract float %2379, 5.000000e-01
  %2381 = fcmp contract olt float %2380, 0.000000e+00
  %2382 = select i1 %2381, float 0x3FA1111120000000, float %2380
  store float %2382, float addrspace(1)* %2378, align 4, !tbaa !9
  %2383 = getelementptr inbounds float, float addrspace(1)* %0, i64 597
  store float %2382, float addrspace(1)* %2383, align 4, !tbaa !9
  %2384 = getelementptr inbounds float, float addrspace(1)* %0, i64 830
  %2385 = load float, float addrspace(1)* %2384, align 4, !tbaa !9
  %2386 = fmul contract float %2385, 5.000000e-01
  %2387 = fcmp contract olt float %2386, 0.000000e+00
  %2388 = select i1 %2387, float 0x3FA1111120000000, float %2386
  store float %2388, float addrspace(1)* %2384, align 4, !tbaa !9
  %2389 = getelementptr inbounds float, float addrspace(1)* %0, i64 627
  store float %2388, float addrspace(1)* %2389, align 4, !tbaa !9
  %2390 = getelementptr inbounds float, float addrspace(1)* %0, i64 831
  %2391 = load float, float addrspace(1)* %2390, align 4, !tbaa !9
  %2392 = fmul contract float %2391, 5.000000e-01
  %2393 = fcmp contract olt float %2392, 0.000000e+00
  %2394 = select i1 %2393, float 0x3FA1111120000000, float %2392
  store float %2394, float addrspace(1)* %2390, align 4, !tbaa !9
  %2395 = getelementptr inbounds float, float addrspace(1)* %0, i64 657
  store float %2394, float addrspace(1)* %2395, align 4, !tbaa !9
  %2396 = getelementptr inbounds float, float addrspace(1)* %0, i64 832
  %2397 = load float, float addrspace(1)* %2396, align 4, !tbaa !9
  %2398 = fmul contract float %2397, 5.000000e-01
  %2399 = fcmp contract olt float %2398, 0.000000e+00
  %2400 = select i1 %2399, float 0x3FA1111120000000, float %2398
  store float %2400, float addrspace(1)* %2396, align 4, !tbaa !9
  %2401 = getelementptr inbounds float, float addrspace(1)* %0, i64 687
  store float %2400, float addrspace(1)* %2401, align 4, !tbaa !9
  %2402 = getelementptr inbounds float, float addrspace(1)* %0, i64 833
  %2403 = load float, float addrspace(1)* %2402, align 4, !tbaa !9
  %2404 = fmul contract float %2403, 5.000000e-01
  %2405 = fcmp contract olt float %2404, 0.000000e+00
  %2406 = select i1 %2405, float 0x3FA1111120000000, float %2404
  store float %2406, float addrspace(1)* %2402, align 4, !tbaa !9
  %2407 = getelementptr inbounds float, float addrspace(1)* %0, i64 717
  store float %2406, float addrspace(1)* %2407, align 4, !tbaa !9
  %2408 = getelementptr inbounds float, float addrspace(1)* %0, i64 834
  %2409 = load float, float addrspace(1)* %2408, align 4, !tbaa !9
  %2410 = fmul contract float %2409, 5.000000e-01
  %2411 = fcmp contract olt float %2410, 0.000000e+00
  %2412 = select i1 %2411, float 0x3FA1111120000000, float %2410
  store float %2412, float addrspace(1)* %2408, align 4, !tbaa !9
  %2413 = getelementptr inbounds float, float addrspace(1)* %0, i64 747
  store float %2412, float addrspace(1)* %2413, align 4, !tbaa !9
  %2414 = getelementptr inbounds float, float addrspace(1)* %0, i64 835
  %2415 = load float, float addrspace(1)* %2414, align 4, !tbaa !9
  %2416 = fmul contract float %2415, 5.000000e-01
  %2417 = fcmp contract olt float %2416, 0.000000e+00
  %2418 = select i1 %2417, float 0x3FA1111120000000, float %2416
  store float %2418, float addrspace(1)* %2414, align 4, !tbaa !9
  %2419 = getelementptr inbounds float, float addrspace(1)* %0, i64 777
  store float %2418, float addrspace(1)* %2419, align 4, !tbaa !9
  %2420 = getelementptr inbounds float, float addrspace(1)* %0, i64 836
  %2421 = load float, float addrspace(1)* %2420, align 4, !tbaa !9
  %2422 = fmul contract float %2421, 5.000000e-01
  %2423 = fcmp contract olt float %2422, 0.000000e+00
  %2424 = select i1 %2423, float 0x3FA1111120000000, float %2422
  store float %2424, float addrspace(1)* %2420, align 4, !tbaa !9
  %2425 = getelementptr inbounds float, float addrspace(1)* %0, i64 807
  store float %2424, float addrspace(1)* %2425, align 4, !tbaa !9
  %2426 = getelementptr inbounds float, float addrspace(1)* %0, i64 840
  %2427 = load float, float addrspace(1)* %2426, align 4, !tbaa !9
  %2428 = fmul contract float %2427, 5.000000e-01
  %2429 = fcmp contract olt float %2428, 0.000000e+00
  %2430 = select i1 %2429, float 0x3FA1111120000000, float %2428
  store float %2430, float addrspace(1)* %2426, align 4, !tbaa !9
  %2431 = getelementptr inbounds float, float addrspace(1)* %0, i64 28
  store float %2430, float addrspace(1)* %2431, align 4, !tbaa !9
  %2432 = getelementptr inbounds float, float addrspace(1)* %0, i64 841
  %2433 = load float, float addrspace(1)* %2432, align 4, !tbaa !9
  %2434 = fmul contract float %2433, 5.000000e-01
  %2435 = fcmp contract olt float %2434, 0.000000e+00
  %2436 = select i1 %2435, float 0x3FA1111120000000, float %2434
  store float %2436, float addrspace(1)* %2432, align 4, !tbaa !9
  %2437 = getelementptr inbounds float, float addrspace(1)* %0, i64 58
  store float %2436, float addrspace(1)* %2437, align 4, !tbaa !9
  %2438 = getelementptr inbounds float, float addrspace(1)* %0, i64 842
  %2439 = load float, float addrspace(1)* %2438, align 4, !tbaa !9
  %2440 = fmul contract float %2439, 5.000000e-01
  %2441 = fcmp contract olt float %2440, 0.000000e+00
  %2442 = select i1 %2441, float 0x3FA1111120000000, float %2440
  store float %2442, float addrspace(1)* %2438, align 4, !tbaa !9
  %2443 = getelementptr inbounds float, float addrspace(1)* %0, i64 88
  store float %2442, float addrspace(1)* %2443, align 4, !tbaa !9
  %2444 = getelementptr inbounds float, float addrspace(1)* %0, i64 843
  %2445 = load float, float addrspace(1)* %2444, align 4, !tbaa !9
  %2446 = fmul contract float %2445, 5.000000e-01
  %2447 = fcmp contract olt float %2446, 0.000000e+00
  %2448 = select i1 %2447, float 0x3FA1111120000000, float %2446
  store float %2448, float addrspace(1)* %2444, align 4, !tbaa !9
  %2449 = getelementptr inbounds float, float addrspace(1)* %0, i64 118
  store float %2448, float addrspace(1)* %2449, align 4, !tbaa !9
  %2450 = getelementptr inbounds float, float addrspace(1)* %0, i64 844
  %2451 = load float, float addrspace(1)* %2450, align 4, !tbaa !9
  %2452 = fmul contract float %2451, 5.000000e-01
  %2453 = fcmp contract olt float %2452, 0.000000e+00
  %2454 = select i1 %2453, float 0x3FA1111120000000, float %2452
  store float %2454, float addrspace(1)* %2450, align 4, !tbaa !9
  %2455 = getelementptr inbounds float, float addrspace(1)* %0, i64 148
  store float %2454, float addrspace(1)* %2455, align 4, !tbaa !9
  %2456 = getelementptr inbounds float, float addrspace(1)* %0, i64 845
  %2457 = load float, float addrspace(1)* %2456, align 4, !tbaa !9
  %2458 = fmul contract float %2457, 5.000000e-01
  %2459 = fcmp contract olt float %2458, 0.000000e+00
  %2460 = select i1 %2459, float 0x3FA1111120000000, float %2458
  store float %2460, float addrspace(1)* %2456, align 4, !tbaa !9
  %2461 = getelementptr inbounds float, float addrspace(1)* %0, i64 178
  store float %2460, float addrspace(1)* %2461, align 4, !tbaa !9
  %2462 = getelementptr inbounds float, float addrspace(1)* %0, i64 846
  %2463 = load float, float addrspace(1)* %2462, align 4, !tbaa !9
  %2464 = fmul contract float %2463, 5.000000e-01
  %2465 = fcmp contract olt float %2464, 0.000000e+00
  %2466 = select i1 %2465, float 0x3FA1111120000000, float %2464
  store float %2466, float addrspace(1)* %2462, align 4, !tbaa !9
  %2467 = getelementptr inbounds float, float addrspace(1)* %0, i64 208
  store float %2466, float addrspace(1)* %2467, align 4, !tbaa !9
  %2468 = getelementptr inbounds float, float addrspace(1)* %0, i64 847
  %2469 = load float, float addrspace(1)* %2468, align 4, !tbaa !9
  %2470 = fmul contract float %2469, 5.000000e-01
  %2471 = fcmp contract olt float %2470, 0.000000e+00
  %2472 = select i1 %2471, float 0x3FA1111120000000, float %2470
  store float %2472, float addrspace(1)* %2468, align 4, !tbaa !9
  %2473 = getelementptr inbounds float, float addrspace(1)* %0, i64 238
  store float %2472, float addrspace(1)* %2473, align 4, !tbaa !9
  %2474 = getelementptr inbounds float, float addrspace(1)* %0, i64 848
  %2475 = load float, float addrspace(1)* %2474, align 4, !tbaa !9
  %2476 = fmul contract float %2475, 5.000000e-01
  %2477 = fcmp contract olt float %2476, 0.000000e+00
  %2478 = select i1 %2477, float 0x3FA1111120000000, float %2476
  store float %2478, float addrspace(1)* %2474, align 4, !tbaa !9
  %2479 = getelementptr inbounds float, float addrspace(1)* %0, i64 268
  store float %2478, float addrspace(1)* %2479, align 4, !tbaa !9
  %2480 = getelementptr inbounds float, float addrspace(1)* %0, i64 849
  %2481 = load float, float addrspace(1)* %2480, align 4, !tbaa !9
  %2482 = fmul contract float %2481, 5.000000e-01
  %2483 = fcmp contract olt float %2482, 0.000000e+00
  %2484 = select i1 %2483, float 0x3FA1111120000000, float %2482
  store float %2484, float addrspace(1)* %2480, align 4, !tbaa !9
  %2485 = getelementptr inbounds float, float addrspace(1)* %0, i64 298
  store float %2484, float addrspace(1)* %2485, align 4, !tbaa !9
  %2486 = getelementptr inbounds float, float addrspace(1)* %0, i64 850
  %2487 = load float, float addrspace(1)* %2486, align 4, !tbaa !9
  %2488 = fmul contract float %2487, 5.000000e-01
  %2489 = fcmp contract olt float %2488, 0.000000e+00
  %2490 = select i1 %2489, float 0x3FA1111120000000, float %2488
  store float %2490, float addrspace(1)* %2486, align 4, !tbaa !9
  %2491 = getelementptr inbounds float, float addrspace(1)* %0, i64 328
  store float %2490, float addrspace(1)* %2491, align 4, !tbaa !9
  %2492 = getelementptr inbounds float, float addrspace(1)* %0, i64 851
  %2493 = load float, float addrspace(1)* %2492, align 4, !tbaa !9
  %2494 = fmul contract float %2493, 5.000000e-01
  %2495 = fcmp contract olt float %2494, 0.000000e+00
  %2496 = select i1 %2495, float 0x3FA1111120000000, float %2494
  store float %2496, float addrspace(1)* %2492, align 4, !tbaa !9
  %2497 = getelementptr inbounds float, float addrspace(1)* %0, i64 358
  store float %2496, float addrspace(1)* %2497, align 4, !tbaa !9
  %2498 = getelementptr inbounds float, float addrspace(1)* %0, i64 852
  %2499 = load float, float addrspace(1)* %2498, align 4, !tbaa !9
  %2500 = fmul contract float %2499, 5.000000e-01
  %2501 = fcmp contract olt float %2500, 0.000000e+00
  %2502 = select i1 %2501, float 0x3FA1111120000000, float %2500
  store float %2502, float addrspace(1)* %2498, align 4, !tbaa !9
  %2503 = getelementptr inbounds float, float addrspace(1)* %0, i64 388
  store float %2502, float addrspace(1)* %2503, align 4, !tbaa !9
  %2504 = getelementptr inbounds float, float addrspace(1)* %0, i64 853
  %2505 = load float, float addrspace(1)* %2504, align 4, !tbaa !9
  %2506 = fmul contract float %2505, 5.000000e-01
  %2507 = fcmp contract olt float %2506, 0.000000e+00
  %2508 = select i1 %2507, float 0x3FA1111120000000, float %2506
  store float %2508, float addrspace(1)* %2504, align 4, !tbaa !9
  %2509 = getelementptr inbounds float, float addrspace(1)* %0, i64 418
  store float %2508, float addrspace(1)* %2509, align 4, !tbaa !9
  %2510 = getelementptr inbounds float, float addrspace(1)* %0, i64 854
  %2511 = load float, float addrspace(1)* %2510, align 4, !tbaa !9
  %2512 = fmul contract float %2511, 5.000000e-01
  %2513 = fcmp contract olt float %2512, 0.000000e+00
  %2514 = select i1 %2513, float 0x3FA1111120000000, float %2512
  store float %2514, float addrspace(1)* %2510, align 4, !tbaa !9
  %2515 = getelementptr inbounds float, float addrspace(1)* %0, i64 448
  store float %2514, float addrspace(1)* %2515, align 4, !tbaa !9
  %2516 = getelementptr inbounds float, float addrspace(1)* %0, i64 855
  %2517 = load float, float addrspace(1)* %2516, align 4, !tbaa !9
  %2518 = fmul contract float %2517, 5.000000e-01
  %2519 = fcmp contract olt float %2518, 0.000000e+00
  %2520 = select i1 %2519, float 0x3FA1111120000000, float %2518
  store float %2520, float addrspace(1)* %2516, align 4, !tbaa !9
  %2521 = getelementptr inbounds float, float addrspace(1)* %0, i64 478
  store float %2520, float addrspace(1)* %2521, align 4, !tbaa !9
  %2522 = getelementptr inbounds float, float addrspace(1)* %0, i64 856
  %2523 = load float, float addrspace(1)* %2522, align 4, !tbaa !9
  %2524 = fmul contract float %2523, 5.000000e-01
  %2525 = fcmp contract olt float %2524, 0.000000e+00
  %2526 = select i1 %2525, float 0x3FA1111120000000, float %2524
  store float %2526, float addrspace(1)* %2522, align 4, !tbaa !9
  %2527 = getelementptr inbounds float, float addrspace(1)* %0, i64 508
  store float %2526, float addrspace(1)* %2527, align 4, !tbaa !9
  %2528 = getelementptr inbounds float, float addrspace(1)* %0, i64 857
  %2529 = load float, float addrspace(1)* %2528, align 4, !tbaa !9
  %2530 = fmul contract float %2529, 5.000000e-01
  %2531 = fcmp contract olt float %2530, 0.000000e+00
  %2532 = select i1 %2531, float 0x3FA1111120000000, float %2530
  store float %2532, float addrspace(1)* %2528, align 4, !tbaa !9
  %2533 = getelementptr inbounds float, float addrspace(1)* %0, i64 538
  store float %2532, float addrspace(1)* %2533, align 4, !tbaa !9
  %2534 = getelementptr inbounds float, float addrspace(1)* %0, i64 858
  %2535 = load float, float addrspace(1)* %2534, align 4, !tbaa !9
  %2536 = fmul contract float %2535, 5.000000e-01
  %2537 = fcmp contract olt float %2536, 0.000000e+00
  %2538 = select i1 %2537, float 0x3FA1111120000000, float %2536
  store float %2538, float addrspace(1)* %2534, align 4, !tbaa !9
  %2539 = getelementptr inbounds float, float addrspace(1)* %0, i64 568
  store float %2538, float addrspace(1)* %2539, align 4, !tbaa !9
  %2540 = getelementptr inbounds float, float addrspace(1)* %0, i64 859
  %2541 = load float, float addrspace(1)* %2540, align 4, !tbaa !9
  %2542 = fmul contract float %2541, 5.000000e-01
  %2543 = fcmp contract olt float %2542, 0.000000e+00
  %2544 = select i1 %2543, float 0x3FA1111120000000, float %2542
  store float %2544, float addrspace(1)* %2540, align 4, !tbaa !9
  %2545 = getelementptr inbounds float, float addrspace(1)* %0, i64 598
  store float %2544, float addrspace(1)* %2545, align 4, !tbaa !9
  %2546 = getelementptr inbounds float, float addrspace(1)* %0, i64 860
  %2547 = load float, float addrspace(1)* %2546, align 4, !tbaa !9
  %2548 = fmul contract float %2547, 5.000000e-01
  %2549 = fcmp contract olt float %2548, 0.000000e+00
  %2550 = select i1 %2549, float 0x3FA1111120000000, float %2548
  store float %2550, float addrspace(1)* %2546, align 4, !tbaa !9
  %2551 = getelementptr inbounds float, float addrspace(1)* %0, i64 628
  store float %2550, float addrspace(1)* %2551, align 4, !tbaa !9
  %2552 = getelementptr inbounds float, float addrspace(1)* %0, i64 861
  %2553 = load float, float addrspace(1)* %2552, align 4, !tbaa !9
  %2554 = fmul contract float %2553, 5.000000e-01
  %2555 = fcmp contract olt float %2554, 0.000000e+00
  %2556 = select i1 %2555, float 0x3FA1111120000000, float %2554
  store float %2556, float addrspace(1)* %2552, align 4, !tbaa !9
  %2557 = getelementptr inbounds float, float addrspace(1)* %0, i64 658
  store float %2556, float addrspace(1)* %2557, align 4, !tbaa !9
  %2558 = getelementptr inbounds float, float addrspace(1)* %0, i64 862
  %2559 = load float, float addrspace(1)* %2558, align 4, !tbaa !9
  %2560 = fmul contract float %2559, 5.000000e-01
  %2561 = fcmp contract olt float %2560, 0.000000e+00
  %2562 = select i1 %2561, float 0x3FA1111120000000, float %2560
  store float %2562, float addrspace(1)* %2558, align 4, !tbaa !9
  %2563 = getelementptr inbounds float, float addrspace(1)* %0, i64 688
  store float %2562, float addrspace(1)* %2563, align 4, !tbaa !9
  %2564 = getelementptr inbounds float, float addrspace(1)* %0, i64 863
  %2565 = load float, float addrspace(1)* %2564, align 4, !tbaa !9
  %2566 = fmul contract float %2565, 5.000000e-01
  %2567 = fcmp contract olt float %2566, 0.000000e+00
  %2568 = select i1 %2567, float 0x3FA1111120000000, float %2566
  store float %2568, float addrspace(1)* %2564, align 4, !tbaa !9
  %2569 = getelementptr inbounds float, float addrspace(1)* %0, i64 718
  store float %2568, float addrspace(1)* %2569, align 4, !tbaa !9
  %2570 = getelementptr inbounds float, float addrspace(1)* %0, i64 864
  %2571 = load float, float addrspace(1)* %2570, align 4, !tbaa !9
  %2572 = fmul contract float %2571, 5.000000e-01
  %2573 = fcmp contract olt float %2572, 0.000000e+00
  %2574 = select i1 %2573, float 0x3FA1111120000000, float %2572
  store float %2574, float addrspace(1)* %2570, align 4, !tbaa !9
  %2575 = getelementptr inbounds float, float addrspace(1)* %0, i64 748
  store float %2574, float addrspace(1)* %2575, align 4, !tbaa !9
  %2576 = getelementptr inbounds float, float addrspace(1)* %0, i64 865
  %2577 = load float, float addrspace(1)* %2576, align 4, !tbaa !9
  %2578 = fmul contract float %2577, 5.000000e-01
  %2579 = fcmp contract olt float %2578, 0.000000e+00
  %2580 = select i1 %2579, float 0x3FA1111120000000, float %2578
  store float %2580, float addrspace(1)* %2576, align 4, !tbaa !9
  %2581 = getelementptr inbounds float, float addrspace(1)* %0, i64 778
  store float %2580, float addrspace(1)* %2581, align 4, !tbaa !9
  %2582 = getelementptr inbounds float, float addrspace(1)* %0, i64 866
  %2583 = load float, float addrspace(1)* %2582, align 4, !tbaa !9
  %2584 = fmul contract float %2583, 5.000000e-01
  %2585 = fcmp contract olt float %2584, 0.000000e+00
  %2586 = select i1 %2585, float 0x3FA1111120000000, float %2584
  store float %2586, float addrspace(1)* %2582, align 4, !tbaa !9
  %2587 = getelementptr inbounds float, float addrspace(1)* %0, i64 808
  store float %2586, float addrspace(1)* %2587, align 4, !tbaa !9
  %2588 = getelementptr inbounds float, float addrspace(1)* %0, i64 867
  %2589 = load float, float addrspace(1)* %2588, align 4, !tbaa !9
  %2590 = fmul contract float %2589, 5.000000e-01
  %2591 = fcmp contract olt float %2590, 0.000000e+00
  %2592 = select i1 %2591, float 0x3FA1111120000000, float %2590
  store float %2592, float addrspace(1)* %2588, align 4, !tbaa !9
  %2593 = getelementptr inbounds float, float addrspace(1)* %0, i64 838
  store float %2592, float addrspace(1)* %2593, align 4, !tbaa !9
  %2594 = getelementptr inbounds float, float addrspace(1)* %0, i64 870
  %2595 = load float, float addrspace(1)* %2594, align 4, !tbaa !9
  %2596 = fmul contract float %2595, 5.000000e-01
  %2597 = fcmp contract olt float %2596, 0.000000e+00
  %2598 = select i1 %2597, float 0x3FA1111120000000, float %2596
  store float %2598, float addrspace(1)* %2594, align 4, !tbaa !9
  %2599 = getelementptr inbounds float, float addrspace(1)* %0, i64 29
  store float %2598, float addrspace(1)* %2599, align 4, !tbaa !9
  %2600 = getelementptr inbounds float, float addrspace(1)* %0, i64 871
  %2601 = load float, float addrspace(1)* %2600, align 4, !tbaa !9
  %2602 = fmul contract float %2601, 5.000000e-01
  %2603 = fcmp contract olt float %2602, 0.000000e+00
  %2604 = select i1 %2603, float 0x3FA1111120000000, float %2602
  store float %2604, float addrspace(1)* %2600, align 4, !tbaa !9
  %2605 = getelementptr inbounds float, float addrspace(1)* %0, i64 59
  store float %2604, float addrspace(1)* %2605, align 4, !tbaa !9
  %2606 = getelementptr inbounds float, float addrspace(1)* %0, i64 872
  %2607 = load float, float addrspace(1)* %2606, align 4, !tbaa !9
  %2608 = fmul contract float %2607, 5.000000e-01
  %2609 = fcmp contract olt float %2608, 0.000000e+00
  %2610 = select i1 %2609, float 0x3FA1111120000000, float %2608
  store float %2610, float addrspace(1)* %2606, align 4, !tbaa !9
  %2611 = getelementptr inbounds float, float addrspace(1)* %0, i64 89
  store float %2610, float addrspace(1)* %2611, align 4, !tbaa !9
  %2612 = getelementptr inbounds float, float addrspace(1)* %0, i64 873
  %2613 = load float, float addrspace(1)* %2612, align 4, !tbaa !9
  %2614 = fmul contract float %2613, 5.000000e-01
  %2615 = fcmp contract olt float %2614, 0.000000e+00
  %2616 = select i1 %2615, float 0x3FA1111120000000, float %2614
  store float %2616, float addrspace(1)* %2612, align 4, !tbaa !9
  %2617 = getelementptr inbounds float, float addrspace(1)* %0, i64 119
  store float %2616, float addrspace(1)* %2617, align 4, !tbaa !9
  %2618 = getelementptr inbounds float, float addrspace(1)* %0, i64 874
  %2619 = load float, float addrspace(1)* %2618, align 4, !tbaa !9
  %2620 = fmul contract float %2619, 5.000000e-01
  %2621 = fcmp contract olt float %2620, 0.000000e+00
  %2622 = select i1 %2621, float 0x3FA1111120000000, float %2620
  store float %2622, float addrspace(1)* %2618, align 4, !tbaa !9
  %2623 = getelementptr inbounds float, float addrspace(1)* %0, i64 149
  store float %2622, float addrspace(1)* %2623, align 4, !tbaa !9
  %2624 = getelementptr inbounds float, float addrspace(1)* %0, i64 875
  %2625 = load float, float addrspace(1)* %2624, align 4, !tbaa !9
  %2626 = fmul contract float %2625, 5.000000e-01
  %2627 = fcmp contract olt float %2626, 0.000000e+00
  %2628 = select i1 %2627, float 0x3FA1111120000000, float %2626
  store float %2628, float addrspace(1)* %2624, align 4, !tbaa !9
  %2629 = getelementptr inbounds float, float addrspace(1)* %0, i64 179
  store float %2628, float addrspace(1)* %2629, align 4, !tbaa !9
  %2630 = getelementptr inbounds float, float addrspace(1)* %0, i64 876
  %2631 = load float, float addrspace(1)* %2630, align 4, !tbaa !9
  %2632 = fmul contract float %2631, 5.000000e-01
  %2633 = fcmp contract olt float %2632, 0.000000e+00
  %2634 = select i1 %2633, float 0x3FA1111120000000, float %2632
  store float %2634, float addrspace(1)* %2630, align 4, !tbaa !9
  %2635 = getelementptr inbounds float, float addrspace(1)* %0, i64 209
  store float %2634, float addrspace(1)* %2635, align 4, !tbaa !9
  %2636 = getelementptr inbounds float, float addrspace(1)* %0, i64 877
  %2637 = load float, float addrspace(1)* %2636, align 4, !tbaa !9
  %2638 = fmul contract float %2637, 5.000000e-01
  %2639 = fcmp contract olt float %2638, 0.000000e+00
  %2640 = select i1 %2639, float 0x3FA1111120000000, float %2638
  store float %2640, float addrspace(1)* %2636, align 4, !tbaa !9
  %2641 = getelementptr inbounds float, float addrspace(1)* %0, i64 239
  store float %2640, float addrspace(1)* %2641, align 4, !tbaa !9
  %2642 = getelementptr inbounds float, float addrspace(1)* %0, i64 878
  %2643 = load float, float addrspace(1)* %2642, align 4, !tbaa !9
  %2644 = fmul contract float %2643, 5.000000e-01
  %2645 = fcmp contract olt float %2644, 0.000000e+00
  %2646 = select i1 %2645, float 0x3FA1111120000000, float %2644
  store float %2646, float addrspace(1)* %2642, align 4, !tbaa !9
  %2647 = getelementptr inbounds float, float addrspace(1)* %0, i64 269
  store float %2646, float addrspace(1)* %2647, align 4, !tbaa !9
  %2648 = getelementptr inbounds float, float addrspace(1)* %0, i64 879
  %2649 = load float, float addrspace(1)* %2648, align 4, !tbaa !9
  %2650 = fmul contract float %2649, 5.000000e-01
  %2651 = fcmp contract olt float %2650, 0.000000e+00
  %2652 = select i1 %2651, float 0x3FA1111120000000, float %2650
  store float %2652, float addrspace(1)* %2648, align 4, !tbaa !9
  %2653 = getelementptr inbounds float, float addrspace(1)* %0, i64 299
  store float %2652, float addrspace(1)* %2653, align 4, !tbaa !9
  %2654 = getelementptr inbounds float, float addrspace(1)* %0, i64 880
  %2655 = load float, float addrspace(1)* %2654, align 4, !tbaa !9
  %2656 = fmul contract float %2655, 5.000000e-01
  %2657 = fcmp contract olt float %2656, 0.000000e+00
  %2658 = select i1 %2657, float 0x3FA1111120000000, float %2656
  store float %2658, float addrspace(1)* %2654, align 4, !tbaa !9
  %2659 = getelementptr inbounds float, float addrspace(1)* %0, i64 329
  store float %2658, float addrspace(1)* %2659, align 4, !tbaa !9
  %2660 = getelementptr inbounds float, float addrspace(1)* %0, i64 881
  %2661 = load float, float addrspace(1)* %2660, align 4, !tbaa !9
  %2662 = fmul contract float %2661, 5.000000e-01
  %2663 = fcmp contract olt float %2662, 0.000000e+00
  %2664 = select i1 %2663, float 0x3FA1111120000000, float %2662
  store float %2664, float addrspace(1)* %2660, align 4, !tbaa !9
  %2665 = getelementptr inbounds float, float addrspace(1)* %0, i64 359
  store float %2664, float addrspace(1)* %2665, align 4, !tbaa !9
  %2666 = getelementptr inbounds float, float addrspace(1)* %0, i64 882
  %2667 = load float, float addrspace(1)* %2666, align 4, !tbaa !9
  %2668 = fmul contract float %2667, 5.000000e-01
  %2669 = fcmp contract olt float %2668, 0.000000e+00
  %2670 = select i1 %2669, float 0x3FA1111120000000, float %2668
  store float %2670, float addrspace(1)* %2666, align 4, !tbaa !9
  %2671 = getelementptr inbounds float, float addrspace(1)* %0, i64 389
  store float %2670, float addrspace(1)* %2671, align 4, !tbaa !9
  %2672 = getelementptr inbounds float, float addrspace(1)* %0, i64 883
  %2673 = load float, float addrspace(1)* %2672, align 4, !tbaa !9
  %2674 = fmul contract float %2673, 5.000000e-01
  %2675 = fcmp contract olt float %2674, 0.000000e+00
  %2676 = select i1 %2675, float 0x3FA1111120000000, float %2674
  store float %2676, float addrspace(1)* %2672, align 4, !tbaa !9
  %2677 = getelementptr inbounds float, float addrspace(1)* %0, i64 419
  store float %2676, float addrspace(1)* %2677, align 4, !tbaa !9
  %2678 = getelementptr inbounds float, float addrspace(1)* %0, i64 884
  %2679 = load float, float addrspace(1)* %2678, align 4, !tbaa !9
  %2680 = fmul contract float %2679, 5.000000e-01
  %2681 = fcmp contract olt float %2680, 0.000000e+00
  %2682 = select i1 %2681, float 0x3FA1111120000000, float %2680
  store float %2682, float addrspace(1)* %2678, align 4, !tbaa !9
  %2683 = getelementptr inbounds float, float addrspace(1)* %0, i64 449
  store float %2682, float addrspace(1)* %2683, align 4, !tbaa !9
  %2684 = getelementptr inbounds float, float addrspace(1)* %0, i64 885
  %2685 = load float, float addrspace(1)* %2684, align 4, !tbaa !9
  %2686 = fmul contract float %2685, 5.000000e-01
  %2687 = fcmp contract olt float %2686, 0.000000e+00
  %2688 = select i1 %2687, float 0x3FA1111120000000, float %2686
  store float %2688, float addrspace(1)* %2684, align 4, !tbaa !9
  %2689 = getelementptr inbounds float, float addrspace(1)* %0, i64 479
  store float %2688, float addrspace(1)* %2689, align 4, !tbaa !9
  %2690 = getelementptr inbounds float, float addrspace(1)* %0, i64 886
  %2691 = load float, float addrspace(1)* %2690, align 4, !tbaa !9
  %2692 = fmul contract float %2691, 5.000000e-01
  %2693 = fcmp contract olt float %2692, 0.000000e+00
  %2694 = select i1 %2693, float 0x3FA1111120000000, float %2692
  store float %2694, float addrspace(1)* %2690, align 4, !tbaa !9
  %2695 = getelementptr inbounds float, float addrspace(1)* %0, i64 509
  store float %2694, float addrspace(1)* %2695, align 4, !tbaa !9
  %2696 = getelementptr inbounds float, float addrspace(1)* %0, i64 887
  %2697 = load float, float addrspace(1)* %2696, align 4, !tbaa !9
  %2698 = fmul contract float %2697, 5.000000e-01
  %2699 = fcmp contract olt float %2698, 0.000000e+00
  %2700 = select i1 %2699, float 0x3FA1111120000000, float %2698
  store float %2700, float addrspace(1)* %2696, align 4, !tbaa !9
  %2701 = getelementptr inbounds float, float addrspace(1)* %0, i64 539
  store float %2700, float addrspace(1)* %2701, align 4, !tbaa !9
  %2702 = getelementptr inbounds float, float addrspace(1)* %0, i64 888
  %2703 = load float, float addrspace(1)* %2702, align 4, !tbaa !9
  %2704 = fmul contract float %2703, 5.000000e-01
  %2705 = fcmp contract olt float %2704, 0.000000e+00
  %2706 = select i1 %2705, float 0x3FA1111120000000, float %2704
  store float %2706, float addrspace(1)* %2702, align 4, !tbaa !9
  %2707 = getelementptr inbounds float, float addrspace(1)* %0, i64 569
  store float %2706, float addrspace(1)* %2707, align 4, !tbaa !9
  %2708 = getelementptr inbounds float, float addrspace(1)* %0, i64 889
  %2709 = load float, float addrspace(1)* %2708, align 4, !tbaa !9
  %2710 = fmul contract float %2709, 5.000000e-01
  %2711 = fcmp contract olt float %2710, 0.000000e+00
  %2712 = select i1 %2711, float 0x3FA1111120000000, float %2710
  store float %2712, float addrspace(1)* %2708, align 4, !tbaa !9
  %2713 = getelementptr inbounds float, float addrspace(1)* %0, i64 599
  store float %2712, float addrspace(1)* %2713, align 4, !tbaa !9
  %2714 = getelementptr inbounds float, float addrspace(1)* %0, i64 890
  %2715 = load float, float addrspace(1)* %2714, align 4, !tbaa !9
  %2716 = fmul contract float %2715, 5.000000e-01
  %2717 = fcmp contract olt float %2716, 0.000000e+00
  %2718 = select i1 %2717, float 0x3FA1111120000000, float %2716
  store float %2718, float addrspace(1)* %2714, align 4, !tbaa !9
  %2719 = getelementptr inbounds float, float addrspace(1)* %0, i64 629
  store float %2718, float addrspace(1)* %2719, align 4, !tbaa !9
  %2720 = getelementptr inbounds float, float addrspace(1)* %0, i64 891
  %2721 = load float, float addrspace(1)* %2720, align 4, !tbaa !9
  %2722 = fmul contract float %2721, 5.000000e-01
  %2723 = fcmp contract olt float %2722, 0.000000e+00
  %2724 = select i1 %2723, float 0x3FA1111120000000, float %2722
  store float %2724, float addrspace(1)* %2720, align 4, !tbaa !9
  %2725 = getelementptr inbounds float, float addrspace(1)* %0, i64 659
  store float %2724, float addrspace(1)* %2725, align 4, !tbaa !9
  %2726 = getelementptr inbounds float, float addrspace(1)* %0, i64 892
  %2727 = load float, float addrspace(1)* %2726, align 4, !tbaa !9
  %2728 = fmul contract float %2727, 5.000000e-01
  %2729 = fcmp contract olt float %2728, 0.000000e+00
  %2730 = select i1 %2729, float 0x3FA1111120000000, float %2728
  store float %2730, float addrspace(1)* %2726, align 4, !tbaa !9
  %2731 = getelementptr inbounds float, float addrspace(1)* %0, i64 689
  store float %2730, float addrspace(1)* %2731, align 4, !tbaa !9
  %2732 = getelementptr inbounds float, float addrspace(1)* %0, i64 893
  %2733 = load float, float addrspace(1)* %2732, align 4, !tbaa !9
  %2734 = fmul contract float %2733, 5.000000e-01
  %2735 = fcmp contract olt float %2734, 0.000000e+00
  %2736 = select i1 %2735, float 0x3FA1111120000000, float %2734
  store float %2736, float addrspace(1)* %2732, align 4, !tbaa !9
  %2737 = getelementptr inbounds float, float addrspace(1)* %0, i64 719
  store float %2736, float addrspace(1)* %2737, align 4, !tbaa !9
  %2738 = getelementptr inbounds float, float addrspace(1)* %0, i64 894
  %2739 = load float, float addrspace(1)* %2738, align 4, !tbaa !9
  %2740 = fmul contract float %2739, 5.000000e-01
  %2741 = fcmp contract olt float %2740, 0.000000e+00
  %2742 = select i1 %2741, float 0x3FA1111120000000, float %2740
  store float %2742, float addrspace(1)* %2738, align 4, !tbaa !9
  %2743 = getelementptr inbounds float, float addrspace(1)* %0, i64 749
  store float %2742, float addrspace(1)* %2743, align 4, !tbaa !9
  %2744 = getelementptr inbounds float, float addrspace(1)* %0, i64 895
  %2745 = load float, float addrspace(1)* %2744, align 4, !tbaa !9
  %2746 = fmul contract float %2745, 5.000000e-01
  %2747 = fcmp contract olt float %2746, 0.000000e+00
  %2748 = select i1 %2747, float 0x3FA1111120000000, float %2746
  store float %2748, float addrspace(1)* %2744, align 4, !tbaa !9
  %2749 = getelementptr inbounds float, float addrspace(1)* %0, i64 779
  store float %2748, float addrspace(1)* %2749, align 4, !tbaa !9
  %2750 = getelementptr inbounds float, float addrspace(1)* %0, i64 896
  %2751 = load float, float addrspace(1)* %2750, align 4, !tbaa !9
  %2752 = fmul contract float %2751, 5.000000e-01
  %2753 = fcmp contract olt float %2752, 0.000000e+00
  %2754 = select i1 %2753, float 0x3FA1111120000000, float %2752
  store float %2754, float addrspace(1)* %2750, align 4, !tbaa !9
  %2755 = getelementptr inbounds float, float addrspace(1)* %0, i64 809
  store float %2754, float addrspace(1)* %2755, align 4, !tbaa !9
  %2756 = getelementptr inbounds float, float addrspace(1)* %0, i64 897
  %2757 = load float, float addrspace(1)* %2756, align 4, !tbaa !9
  %2758 = fmul contract float %2757, 5.000000e-01
  %2759 = fcmp contract olt float %2758, 0.000000e+00
  %2760 = select i1 %2759, float 0x3FA1111120000000, float %2758
  store float %2760, float addrspace(1)* %2756, align 4, !tbaa !9
  %2761 = getelementptr inbounds float, float addrspace(1)* %0, i64 839
  store float %2760, float addrspace(1)* %2761, align 4, !tbaa !9
  %2762 = getelementptr inbounds float, float addrspace(1)* %0, i64 898
  %2763 = load float, float addrspace(1)* %2762, align 4, !tbaa !9
  %2764 = fmul contract float %2763, 5.000000e-01
  %2765 = fcmp contract olt float %2764, 0.000000e+00
  %2766 = select i1 %2765, float 0x3FA1111120000000, float %2764
  store float %2766, float addrspace(1)* %2762, align 4, !tbaa !9
  %2767 = getelementptr inbounds float, float addrspace(1)* %0, i64 869
  store float %2766, float addrspace(1)* %2767, align 4, !tbaa !9
  br label %2768

2768:                                             ; preds = %157, %2768
  %2769 = phi i32 [ %3224, %2768 ], [ 0, %157 ]
  %2770 = mul nuw nsw i32 %2769, 30
  %2771 = zext i32 %2769 to i64
  %2772 = getelementptr inbounds float, float addrspace(1)* %3, i64 %2771
  %2773 = zext i32 %2770 to i64
  %2774 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2773
  %2775 = load i32, i32 addrspace(1)* %2774, align 4, !tbaa !11
  %2776 = or i32 %2770, 1
  %2777 = zext i32 %2776 to i64
  %2778 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2777
  %2779 = load i32, i32 addrspace(1)* %2778, align 4, !tbaa !11
  %2780 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2781 = fdiv contract float 1.000000e+02, %2780
  %2782 = mul nsw i32 %2775, 30
  %2783 = add nsw i32 %2782, %2779
  %2784 = sext i32 %2783 to i64
  %2785 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2784
  %2786 = load float, float addrspace(1)* %2785, align 4, !tbaa !9
  %2787 = fadd contract float %2786, %2781
  store float %2787, float addrspace(1)* %2785, align 4, !tbaa !9
  %2788 = mul nsw i32 %2779, 30
  %2789 = add nsw i32 %2788, %2775
  %2790 = sext i32 %2789 to i64
  %2791 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2790
  store float %2787, float addrspace(1)* %2791, align 4, !tbaa !9
  %2792 = add nuw nsw i32 %2770, 2
  %2793 = zext i32 %2792 to i64
  %2794 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2793
  %2795 = load i32, i32 addrspace(1)* %2794, align 4, !tbaa !11
  %2796 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2797 = fdiv contract float 1.000000e+02, %2796
  %2798 = add nsw i32 %2788, %2795
  %2799 = sext i32 %2798 to i64
  %2800 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2799
  %2801 = load float, float addrspace(1)* %2800, align 4, !tbaa !9
  %2802 = fadd contract float %2801, %2797
  store float %2802, float addrspace(1)* %2800, align 4, !tbaa !9
  %2803 = mul nsw i32 %2795, 30
  %2804 = add nsw i32 %2803, %2779
  %2805 = sext i32 %2804 to i64
  %2806 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2805
  store float %2802, float addrspace(1)* %2806, align 4, !tbaa !9
  %2807 = add nuw nsw i32 %2770, 3
  %2808 = zext i32 %2807 to i64
  %2809 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2808
  %2810 = load i32, i32 addrspace(1)* %2809, align 4, !tbaa !11
  %2811 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2812 = fdiv contract float 1.000000e+02, %2811
  %2813 = add nsw i32 %2803, %2810
  %2814 = sext i32 %2813 to i64
  %2815 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2814
  %2816 = load float, float addrspace(1)* %2815, align 4, !tbaa !9
  %2817 = fadd contract float %2816, %2812
  store float %2817, float addrspace(1)* %2815, align 4, !tbaa !9
  %2818 = mul nsw i32 %2810, 30
  %2819 = add nsw i32 %2818, %2795
  %2820 = sext i32 %2819 to i64
  %2821 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2820
  store float %2817, float addrspace(1)* %2821, align 4, !tbaa !9
  %2822 = add nuw nsw i32 %2770, 4
  %2823 = zext i32 %2822 to i64
  %2824 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2823
  %2825 = load i32, i32 addrspace(1)* %2824, align 4, !tbaa !11
  %2826 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2827 = fdiv contract float 1.000000e+02, %2826
  %2828 = add nsw i32 %2818, %2825
  %2829 = sext i32 %2828 to i64
  %2830 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2829
  %2831 = load float, float addrspace(1)* %2830, align 4, !tbaa !9
  %2832 = fadd contract float %2831, %2827
  store float %2832, float addrspace(1)* %2830, align 4, !tbaa !9
  %2833 = mul nsw i32 %2825, 30
  %2834 = add nsw i32 %2833, %2810
  %2835 = sext i32 %2834 to i64
  %2836 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2835
  store float %2832, float addrspace(1)* %2836, align 4, !tbaa !9
  %2837 = add nuw nsw i32 %2770, 5
  %2838 = zext i32 %2837 to i64
  %2839 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2838
  %2840 = load i32, i32 addrspace(1)* %2839, align 4, !tbaa !11
  %2841 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2842 = fdiv contract float 1.000000e+02, %2841
  %2843 = add nsw i32 %2833, %2840
  %2844 = sext i32 %2843 to i64
  %2845 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2844
  %2846 = load float, float addrspace(1)* %2845, align 4, !tbaa !9
  %2847 = fadd contract float %2846, %2842
  store float %2847, float addrspace(1)* %2845, align 4, !tbaa !9
  %2848 = mul nsw i32 %2840, 30
  %2849 = add nsw i32 %2848, %2825
  %2850 = sext i32 %2849 to i64
  %2851 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2850
  store float %2847, float addrspace(1)* %2851, align 4, !tbaa !9
  %2852 = add nuw nsw i32 %2770, 6
  %2853 = zext i32 %2852 to i64
  %2854 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2853
  %2855 = load i32, i32 addrspace(1)* %2854, align 4, !tbaa !11
  %2856 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2857 = fdiv contract float 1.000000e+02, %2856
  %2858 = add nsw i32 %2848, %2855
  %2859 = sext i32 %2858 to i64
  %2860 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2859
  %2861 = load float, float addrspace(1)* %2860, align 4, !tbaa !9
  %2862 = fadd contract float %2861, %2857
  store float %2862, float addrspace(1)* %2860, align 4, !tbaa !9
  %2863 = mul nsw i32 %2855, 30
  %2864 = add nsw i32 %2863, %2840
  %2865 = sext i32 %2864 to i64
  %2866 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2865
  store float %2862, float addrspace(1)* %2866, align 4, !tbaa !9
  %2867 = add nuw nsw i32 %2770, 7
  %2868 = zext i32 %2867 to i64
  %2869 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2868
  %2870 = load i32, i32 addrspace(1)* %2869, align 4, !tbaa !11
  %2871 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2872 = fdiv contract float 1.000000e+02, %2871
  %2873 = add nsw i32 %2863, %2870
  %2874 = sext i32 %2873 to i64
  %2875 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2874
  %2876 = load float, float addrspace(1)* %2875, align 4, !tbaa !9
  %2877 = fadd contract float %2876, %2872
  store float %2877, float addrspace(1)* %2875, align 4, !tbaa !9
  %2878 = mul nsw i32 %2870, 30
  %2879 = add nsw i32 %2878, %2855
  %2880 = sext i32 %2879 to i64
  %2881 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2880
  store float %2877, float addrspace(1)* %2881, align 4, !tbaa !9
  %2882 = add nuw nsw i32 %2770, 8
  %2883 = zext i32 %2882 to i64
  %2884 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2883
  %2885 = load i32, i32 addrspace(1)* %2884, align 4, !tbaa !11
  %2886 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2887 = fdiv contract float 1.000000e+02, %2886
  %2888 = add nsw i32 %2878, %2885
  %2889 = sext i32 %2888 to i64
  %2890 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2889
  %2891 = load float, float addrspace(1)* %2890, align 4, !tbaa !9
  %2892 = fadd contract float %2891, %2887
  store float %2892, float addrspace(1)* %2890, align 4, !tbaa !9
  %2893 = mul nsw i32 %2885, 30
  %2894 = add nsw i32 %2893, %2870
  %2895 = sext i32 %2894 to i64
  %2896 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2895
  store float %2892, float addrspace(1)* %2896, align 4, !tbaa !9
  %2897 = add nuw nsw i32 %2770, 9
  %2898 = zext i32 %2897 to i64
  %2899 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2898
  %2900 = load i32, i32 addrspace(1)* %2899, align 4, !tbaa !11
  %2901 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2902 = fdiv contract float 1.000000e+02, %2901
  %2903 = add nsw i32 %2893, %2900
  %2904 = sext i32 %2903 to i64
  %2905 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2904
  %2906 = load float, float addrspace(1)* %2905, align 4, !tbaa !9
  %2907 = fadd contract float %2906, %2902
  store float %2907, float addrspace(1)* %2905, align 4, !tbaa !9
  %2908 = mul nsw i32 %2900, 30
  %2909 = add nsw i32 %2908, %2885
  %2910 = sext i32 %2909 to i64
  %2911 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2910
  store float %2907, float addrspace(1)* %2911, align 4, !tbaa !9
  %2912 = add nuw nsw i32 %2770, 10
  %2913 = zext i32 %2912 to i64
  %2914 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2913
  %2915 = load i32, i32 addrspace(1)* %2914, align 4, !tbaa !11
  %2916 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2917 = fdiv contract float 1.000000e+02, %2916
  %2918 = add nsw i32 %2908, %2915
  %2919 = sext i32 %2918 to i64
  %2920 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2919
  %2921 = load float, float addrspace(1)* %2920, align 4, !tbaa !9
  %2922 = fadd contract float %2921, %2917
  store float %2922, float addrspace(1)* %2920, align 4, !tbaa !9
  %2923 = mul nsw i32 %2915, 30
  %2924 = add nsw i32 %2923, %2900
  %2925 = sext i32 %2924 to i64
  %2926 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2925
  store float %2922, float addrspace(1)* %2926, align 4, !tbaa !9
  %2927 = add nuw nsw i32 %2770, 11
  %2928 = zext i32 %2927 to i64
  %2929 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2928
  %2930 = load i32, i32 addrspace(1)* %2929, align 4, !tbaa !11
  %2931 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2932 = fdiv contract float 1.000000e+02, %2931
  %2933 = add nsw i32 %2923, %2930
  %2934 = sext i32 %2933 to i64
  %2935 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2934
  %2936 = load float, float addrspace(1)* %2935, align 4, !tbaa !9
  %2937 = fadd contract float %2936, %2932
  store float %2937, float addrspace(1)* %2935, align 4, !tbaa !9
  %2938 = mul nsw i32 %2930, 30
  %2939 = add nsw i32 %2938, %2915
  %2940 = sext i32 %2939 to i64
  %2941 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2940
  store float %2937, float addrspace(1)* %2941, align 4, !tbaa !9
  %2942 = add nuw nsw i32 %2770, 12
  %2943 = zext i32 %2942 to i64
  %2944 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2943
  %2945 = load i32, i32 addrspace(1)* %2944, align 4, !tbaa !11
  %2946 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2947 = fdiv contract float 1.000000e+02, %2946
  %2948 = add nsw i32 %2938, %2945
  %2949 = sext i32 %2948 to i64
  %2950 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2949
  %2951 = load float, float addrspace(1)* %2950, align 4, !tbaa !9
  %2952 = fadd contract float %2951, %2947
  store float %2952, float addrspace(1)* %2950, align 4, !tbaa !9
  %2953 = mul nsw i32 %2945, 30
  %2954 = add nsw i32 %2953, %2930
  %2955 = sext i32 %2954 to i64
  %2956 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2955
  store float %2952, float addrspace(1)* %2956, align 4, !tbaa !9
  %2957 = add nuw nsw i32 %2770, 13
  %2958 = zext i32 %2957 to i64
  %2959 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2958
  %2960 = load i32, i32 addrspace(1)* %2959, align 4, !tbaa !11
  %2961 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2962 = fdiv contract float 1.000000e+02, %2961
  %2963 = add nsw i32 %2953, %2960
  %2964 = sext i32 %2963 to i64
  %2965 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2964
  %2966 = load float, float addrspace(1)* %2965, align 4, !tbaa !9
  %2967 = fadd contract float %2966, %2962
  store float %2967, float addrspace(1)* %2965, align 4, !tbaa !9
  %2968 = mul nsw i32 %2960, 30
  %2969 = add nsw i32 %2968, %2945
  %2970 = sext i32 %2969 to i64
  %2971 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2970
  store float %2967, float addrspace(1)* %2971, align 4, !tbaa !9
  %2972 = add nuw nsw i32 %2770, 14
  %2973 = zext i32 %2972 to i64
  %2974 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2973
  %2975 = load i32, i32 addrspace(1)* %2974, align 4, !tbaa !11
  %2976 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2977 = fdiv contract float 1.000000e+02, %2976
  %2978 = add nsw i32 %2968, %2975
  %2979 = sext i32 %2978 to i64
  %2980 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2979
  %2981 = load float, float addrspace(1)* %2980, align 4, !tbaa !9
  %2982 = fadd contract float %2981, %2977
  store float %2982, float addrspace(1)* %2980, align 4, !tbaa !9
  %2983 = mul nsw i32 %2975, 30
  %2984 = add nsw i32 %2983, %2960
  %2985 = sext i32 %2984 to i64
  %2986 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2985
  store float %2982, float addrspace(1)* %2986, align 4, !tbaa !9
  %2987 = add nuw nsw i32 %2770, 15
  %2988 = zext i32 %2987 to i64
  %2989 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %2988
  %2990 = load i32, i32 addrspace(1)* %2989, align 4, !tbaa !11
  %2991 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %2992 = fdiv contract float 1.000000e+02, %2991
  %2993 = add nsw i32 %2983, %2990
  %2994 = sext i32 %2993 to i64
  %2995 = getelementptr inbounds float, float addrspace(1)* %0, i64 %2994
  %2996 = load float, float addrspace(1)* %2995, align 4, !tbaa !9
  %2997 = fadd contract float %2996, %2992
  store float %2997, float addrspace(1)* %2995, align 4, !tbaa !9
  %2998 = mul nsw i32 %2990, 30
  %2999 = add nsw i32 %2998, %2975
  %3000 = sext i32 %2999 to i64
  %3001 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3000
  store float %2997, float addrspace(1)* %3001, align 4, !tbaa !9
  %3002 = add nuw nsw i32 %2770, 16
  %3003 = zext i32 %3002 to i64
  %3004 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3003
  %3005 = load i32, i32 addrspace(1)* %3004, align 4, !tbaa !11
  %3006 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3007 = fdiv contract float 1.000000e+02, %3006
  %3008 = add nsw i32 %2998, %3005
  %3009 = sext i32 %3008 to i64
  %3010 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3009
  %3011 = load float, float addrspace(1)* %3010, align 4, !tbaa !9
  %3012 = fadd contract float %3011, %3007
  store float %3012, float addrspace(1)* %3010, align 4, !tbaa !9
  %3013 = mul nsw i32 %3005, 30
  %3014 = add nsw i32 %3013, %2990
  %3015 = sext i32 %3014 to i64
  %3016 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3015
  store float %3012, float addrspace(1)* %3016, align 4, !tbaa !9
  %3017 = add nuw nsw i32 %2770, 17
  %3018 = zext i32 %3017 to i64
  %3019 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3018
  %3020 = load i32, i32 addrspace(1)* %3019, align 4, !tbaa !11
  %3021 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3022 = fdiv contract float 1.000000e+02, %3021
  %3023 = add nsw i32 %3013, %3020
  %3024 = sext i32 %3023 to i64
  %3025 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3024
  %3026 = load float, float addrspace(1)* %3025, align 4, !tbaa !9
  %3027 = fadd contract float %3026, %3022
  store float %3027, float addrspace(1)* %3025, align 4, !tbaa !9
  %3028 = mul nsw i32 %3020, 30
  %3029 = add nsw i32 %3028, %3005
  %3030 = sext i32 %3029 to i64
  %3031 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3030
  store float %3027, float addrspace(1)* %3031, align 4, !tbaa !9
  %3032 = add nuw nsw i32 %2770, 18
  %3033 = zext i32 %3032 to i64
  %3034 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3033
  %3035 = load i32, i32 addrspace(1)* %3034, align 4, !tbaa !11
  %3036 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3037 = fdiv contract float 1.000000e+02, %3036
  %3038 = add nsw i32 %3028, %3035
  %3039 = sext i32 %3038 to i64
  %3040 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3039
  %3041 = load float, float addrspace(1)* %3040, align 4, !tbaa !9
  %3042 = fadd contract float %3041, %3037
  store float %3042, float addrspace(1)* %3040, align 4, !tbaa !9
  %3043 = mul nsw i32 %3035, 30
  %3044 = add nsw i32 %3043, %3020
  %3045 = sext i32 %3044 to i64
  %3046 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3045
  store float %3042, float addrspace(1)* %3046, align 4, !tbaa !9
  %3047 = add nuw nsw i32 %2770, 19
  %3048 = zext i32 %3047 to i64
  %3049 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3048
  %3050 = load i32, i32 addrspace(1)* %3049, align 4, !tbaa !11
  %3051 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3052 = fdiv contract float 1.000000e+02, %3051
  %3053 = add nsw i32 %3043, %3050
  %3054 = sext i32 %3053 to i64
  %3055 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3054
  %3056 = load float, float addrspace(1)* %3055, align 4, !tbaa !9
  %3057 = fadd contract float %3056, %3052
  store float %3057, float addrspace(1)* %3055, align 4, !tbaa !9
  %3058 = mul nsw i32 %3050, 30
  %3059 = add nsw i32 %3058, %3035
  %3060 = sext i32 %3059 to i64
  %3061 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3060
  store float %3057, float addrspace(1)* %3061, align 4, !tbaa !9
  %3062 = add nuw nsw i32 %2770, 20
  %3063 = zext i32 %3062 to i64
  %3064 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3063
  %3065 = load i32, i32 addrspace(1)* %3064, align 4, !tbaa !11
  %3066 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3067 = fdiv contract float 1.000000e+02, %3066
  %3068 = add nsw i32 %3058, %3065
  %3069 = sext i32 %3068 to i64
  %3070 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3069
  %3071 = load float, float addrspace(1)* %3070, align 4, !tbaa !9
  %3072 = fadd contract float %3071, %3067
  store float %3072, float addrspace(1)* %3070, align 4, !tbaa !9
  %3073 = mul nsw i32 %3065, 30
  %3074 = add nsw i32 %3073, %3050
  %3075 = sext i32 %3074 to i64
  %3076 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3075
  store float %3072, float addrspace(1)* %3076, align 4, !tbaa !9
  %3077 = add nuw nsw i32 %2770, 21
  %3078 = zext i32 %3077 to i64
  %3079 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3078
  %3080 = load i32, i32 addrspace(1)* %3079, align 4, !tbaa !11
  %3081 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3082 = fdiv contract float 1.000000e+02, %3081
  %3083 = add nsw i32 %3073, %3080
  %3084 = sext i32 %3083 to i64
  %3085 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3084
  %3086 = load float, float addrspace(1)* %3085, align 4, !tbaa !9
  %3087 = fadd contract float %3086, %3082
  store float %3087, float addrspace(1)* %3085, align 4, !tbaa !9
  %3088 = mul nsw i32 %3080, 30
  %3089 = add nsw i32 %3088, %3065
  %3090 = sext i32 %3089 to i64
  %3091 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3090
  store float %3087, float addrspace(1)* %3091, align 4, !tbaa !9
  %3092 = add nuw nsw i32 %2770, 22
  %3093 = zext i32 %3092 to i64
  %3094 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3093
  %3095 = load i32, i32 addrspace(1)* %3094, align 4, !tbaa !11
  %3096 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3097 = fdiv contract float 1.000000e+02, %3096
  %3098 = add nsw i32 %3088, %3095
  %3099 = sext i32 %3098 to i64
  %3100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3099
  %3101 = load float, float addrspace(1)* %3100, align 4, !tbaa !9
  %3102 = fadd contract float %3101, %3097
  store float %3102, float addrspace(1)* %3100, align 4, !tbaa !9
  %3103 = mul nsw i32 %3095, 30
  %3104 = add nsw i32 %3103, %3080
  %3105 = sext i32 %3104 to i64
  %3106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3105
  store float %3102, float addrspace(1)* %3106, align 4, !tbaa !9
  %3107 = add nuw nsw i32 %2770, 23
  %3108 = zext i32 %3107 to i64
  %3109 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3108
  %3110 = load i32, i32 addrspace(1)* %3109, align 4, !tbaa !11
  %3111 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3112 = fdiv contract float 1.000000e+02, %3111
  %3113 = add nsw i32 %3103, %3110
  %3114 = sext i32 %3113 to i64
  %3115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3114
  %3116 = load float, float addrspace(1)* %3115, align 4, !tbaa !9
  %3117 = fadd contract float %3116, %3112
  store float %3117, float addrspace(1)* %3115, align 4, !tbaa !9
  %3118 = mul nsw i32 %3110, 30
  %3119 = add nsw i32 %3118, %3095
  %3120 = sext i32 %3119 to i64
  %3121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3120
  store float %3117, float addrspace(1)* %3121, align 4, !tbaa !9
  %3122 = add nuw nsw i32 %2770, 24
  %3123 = zext i32 %3122 to i64
  %3124 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3123
  %3125 = load i32, i32 addrspace(1)* %3124, align 4, !tbaa !11
  %3126 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3127 = fdiv contract float 1.000000e+02, %3126
  %3128 = add nsw i32 %3118, %3125
  %3129 = sext i32 %3128 to i64
  %3130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3129
  %3131 = load float, float addrspace(1)* %3130, align 4, !tbaa !9
  %3132 = fadd contract float %3131, %3127
  store float %3132, float addrspace(1)* %3130, align 4, !tbaa !9
  %3133 = mul nsw i32 %3125, 30
  %3134 = add nsw i32 %3133, %3110
  %3135 = sext i32 %3134 to i64
  %3136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3135
  store float %3132, float addrspace(1)* %3136, align 4, !tbaa !9
  %3137 = add nuw nsw i32 %2770, 25
  %3138 = zext i32 %3137 to i64
  %3139 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3138
  %3140 = load i32, i32 addrspace(1)* %3139, align 4, !tbaa !11
  %3141 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3142 = fdiv contract float 1.000000e+02, %3141
  %3143 = add nsw i32 %3133, %3140
  %3144 = sext i32 %3143 to i64
  %3145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3144
  %3146 = load float, float addrspace(1)* %3145, align 4, !tbaa !9
  %3147 = fadd contract float %3146, %3142
  store float %3147, float addrspace(1)* %3145, align 4, !tbaa !9
  %3148 = mul nsw i32 %3140, 30
  %3149 = add nsw i32 %3148, %3125
  %3150 = sext i32 %3149 to i64
  %3151 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3150
  store float %3147, float addrspace(1)* %3151, align 4, !tbaa !9
  %3152 = add nuw nsw i32 %2770, 26
  %3153 = zext i32 %3152 to i64
  %3154 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3153
  %3155 = load i32, i32 addrspace(1)* %3154, align 4, !tbaa !11
  %3156 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3157 = fdiv contract float 1.000000e+02, %3156
  %3158 = add nsw i32 %3148, %3155
  %3159 = sext i32 %3158 to i64
  %3160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3159
  %3161 = load float, float addrspace(1)* %3160, align 4, !tbaa !9
  %3162 = fadd contract float %3161, %3157
  store float %3162, float addrspace(1)* %3160, align 4, !tbaa !9
  %3163 = mul nsw i32 %3155, 30
  %3164 = add nsw i32 %3163, %3140
  %3165 = sext i32 %3164 to i64
  %3166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3165
  store float %3162, float addrspace(1)* %3166, align 4, !tbaa !9
  %3167 = add nuw nsw i32 %2770, 27
  %3168 = zext i32 %3167 to i64
  %3169 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3168
  %3170 = load i32, i32 addrspace(1)* %3169, align 4, !tbaa !11
  %3171 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3172 = fdiv contract float 1.000000e+02, %3171
  %3173 = add nsw i32 %3163, %3170
  %3174 = sext i32 %3173 to i64
  %3175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3174
  %3176 = load float, float addrspace(1)* %3175, align 4, !tbaa !9
  %3177 = fadd contract float %3176, %3172
  store float %3177, float addrspace(1)* %3175, align 4, !tbaa !9
  %3178 = mul nsw i32 %3170, 30
  %3179 = add nsw i32 %3178, %3155
  %3180 = sext i32 %3179 to i64
  %3181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3180
  store float %3177, float addrspace(1)* %3181, align 4, !tbaa !9
  %3182 = add nuw nsw i32 %2770, 28
  %3183 = zext i32 %3182 to i64
  %3184 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3183
  %3185 = load i32, i32 addrspace(1)* %3184, align 4, !tbaa !11
  %3186 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3187 = fdiv contract float 1.000000e+02, %3186
  %3188 = add nsw i32 %3178, %3185
  %3189 = sext i32 %3188 to i64
  %3190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3189
  %3191 = load float, float addrspace(1)* %3190, align 4, !tbaa !9
  %3192 = fadd contract float %3191, %3187
  store float %3192, float addrspace(1)* %3190, align 4, !tbaa !9
  %3193 = mul nsw i32 %3185, 30
  %3194 = add nsw i32 %3193, %3170
  %3195 = sext i32 %3194 to i64
  %3196 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3195
  store float %3192, float addrspace(1)* %3196, align 4, !tbaa !9
  %3197 = add nuw nsw i32 %2770, 29
  %3198 = zext i32 %3197 to i64
  %3199 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %3198
  %3200 = load i32, i32 addrspace(1)* %3199, align 4, !tbaa !11
  %3201 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3202 = fdiv contract float 1.000000e+02, %3201
  %3203 = add nsw i32 %3193, %3200
  %3204 = sext i32 %3203 to i64
  %3205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3204
  %3206 = load float, float addrspace(1)* %3205, align 4, !tbaa !9
  %3207 = fadd contract float %3206, %3202
  store float %3207, float addrspace(1)* %3205, align 4, !tbaa !9
  %3208 = mul nsw i32 %3200, 30
  %3209 = add nsw i32 %3208, %3185
  %3210 = sext i32 %3209 to i64
  %3211 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3210
  store float %3207, float addrspace(1)* %3211, align 4, !tbaa !9
  %3212 = load i32, i32 addrspace(1)* %2774, align 4, !tbaa !11
  %3213 = load float, float addrspace(1)* %2772, align 4, !tbaa !9
  %3214 = fdiv contract float 1.000000e+02, %3213
  %3215 = add nsw i32 %3208, %3212
  %3216 = sext i32 %3215 to i64
  %3217 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3216
  %3218 = load float, float addrspace(1)* %3217, align 4, !tbaa !9
  %3219 = fadd contract float %3218, %3214
  store float %3219, float addrspace(1)* %3217, align 4, !tbaa !9
  %3220 = mul nsw i32 %3212, 30
  %3221 = add nsw i32 %3220, %3200
  %3222 = sext i32 %3221 to i64
  %3223 = getelementptr inbounds float, float addrspace(1)* %0, i64 %3222
  store float %3219, float addrspace(1)* %3223, align 4, !tbaa !9
  %3224 = add nuw nsw i32 %2769, 1
  %3225 = icmp eq i32 %3224, 30
  br i1 %3225, label %3226, label %2768, !llvm.loop !13

3226:                                             ; preds = %2768
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !5, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !5, i64 0}
!13 = distinct !{!13, !8}
