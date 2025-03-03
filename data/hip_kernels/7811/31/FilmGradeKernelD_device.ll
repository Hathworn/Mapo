; ModuleID = '../data/hip_kernels/7811/31/main.cu'
source_filename = "../data/hip_kernels/7811/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16FilmGradeKernelDPfS_iifi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, float %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = sitofp i32 %3 to float
  %25 = sitofp i32 %2 to float
  %26 = sitofp i32 %15 to float
  %27 = sitofp i32 %23 to float
  %28 = fdiv contract float %25, 1.920000e+03
  %29 = icmp slt i32 %15, %2
  %30 = icmp slt i32 %23, %3
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %180

32:                                               ; preds = %6
  %33 = mul nsw i32 %23, %2
  %34 = add nsw i32 %33, %15
  %35 = shl nsw i32 %34, 2
  switch i32 %5, label %180 [
    i32 1, label %43
    i32 2, label %36
  ]

36:                                               ; preds = %32
  %37 = fdiv contract float %27, %24
  %38 = fmul contract float %28, 0x3F747AE140000000
  %39 = fadd contract float %38, %4
  %40 = fcmp contract ult float %37, %4
  %41 = fcmp contract ugt float %37, %39
  %42 = select i1 %40, i1 true, i1 %41
  br i1 %42, label %156, label %110

43:                                               ; preds = %32
  %44 = fdiv contract float %27, %24
  %45 = fcmp contract ult float %44, %4
  %46 = fmul contract float %28, 0x3F747AE140000000
  %47 = fadd contract float %46, %4
  %48 = fcmp contract ugt float %44, %47
  %49 = select i1 %45, i1 true, i1 %48
  br i1 %49, label %97, label %50

50:                                               ; preds = %43
  %51 = tail call float @llvm.fabs.f32(float %26)
  %52 = fcmp ogt float %51, 2.000000e+00
  br i1 %52, label %53, label %86

53:                                               ; preds = %50
  %54 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %51)
  %55 = tail call float @llvm.amdgcn.frexp.mant.f32(float %51)
  %56 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 12)
  %57 = add i32 %54, -2
  %58 = icmp sgt i32 %57, 12
  br i1 %58, label %59, label %70

59:                                               ; preds = %53, %59
  %60 = phi float [ %67, %59 ], [ %56, %53 ]
  %61 = phi i32 [ %68, %59 ], [ %57, %53 ]
  %62 = tail call float @llvm.rint.f32(float %60)
  %63 = fsub float %60, %62
  %64 = fcmp olt float %63, 0.000000e+00
  %65 = select i1 %64, float 1.000000e+00, float -0.000000e+00
  %66 = fadd float %63, %65
  %67 = tail call float @llvm.amdgcn.ldexp.f32(float %66, i32 12)
  %68 = add nsw i32 %61, -12
  %69 = icmp ugt i32 %61, 24
  br i1 %69, label %59, label %70

70:                                               ; preds = %59, %53
  %71 = phi i32 [ %57, %53 ], [ %68, %59 ]
  %72 = phi float [ %56, %53 ], [ %67, %59 ]
  %73 = add nsw i32 %71, -11
  %74 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 %73)
  %75 = tail call float @llvm.rint.f32(float %74)
  %76 = fsub float %74, %75
  %77 = fcmp olt float %76, 0.000000e+00
  %78 = select i1 %77, float 1.000000e+00, float -0.000000e+00
  %79 = fadd float %76, %78
  %80 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 1)
  %81 = bitcast float %26 to i32
  %82 = and i32 %81, -2147483648
  %83 = bitcast float %80 to i32
  %84 = xor i32 %82, %83
  %85 = bitcast i32 %84 to float
  br label %90

86:                                               ; preds = %50
  %87 = fcmp oeq float %51, 2.000000e+00
  %88 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %26)
  %89 = select i1 %87, float %88, float %26
  br label %90

90:                                               ; preds = %70, %86
  %91 = phi float [ %85, %70 ], [ %89, %86 ]
  %92 = tail call i1 @llvm.amdgcn.class.f32(float %26, i32 504)
  %93 = select i1 %92, float %91, float 0x7FF8000000000000
  %94 = fcmp contract une float %93, 0.000000e+00
  %95 = select contract i1 %94, float 1.000000e+00, float 0.000000e+00
  %96 = sext i32 %35 to i64
  br label %176

97:                                               ; preds = %43
  %98 = sext i32 %35 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = fmul contract float %28, 5.000000e+00
  %102 = fsub contract float %27, %101
  %103 = fdiv contract float %102, %24
  %104 = fcmp contract ult float %100, %103
  br i1 %104, label %176, label %105

105:                                              ; preds = %97
  %106 = fadd contract float %101, %27
  %107 = fdiv contract float %106, %24
  %108 = fcmp contract ole float %100, %107
  %109 = select contract i1 %108, float 1.000000e+00, float 0.000000e+00
  br label %176

110:                                              ; preds = %36
  %111 = tail call float @llvm.fabs.f32(float %26)
  %112 = fcmp ogt float %111, 2.000000e+00
  br i1 %112, label %113, label %146

113:                                              ; preds = %110
  %114 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %111)
  %115 = tail call float @llvm.amdgcn.frexp.mant.f32(float %111)
  %116 = tail call float @llvm.amdgcn.ldexp.f32(float %115, i32 12)
  %117 = add i32 %114, -2
  %118 = icmp sgt i32 %117, 12
  br i1 %118, label %119, label %130

119:                                              ; preds = %113, %119
  %120 = phi float [ %127, %119 ], [ %116, %113 ]
  %121 = phi i32 [ %128, %119 ], [ %117, %113 ]
  %122 = tail call float @llvm.rint.f32(float %120)
  %123 = fsub float %120, %122
  %124 = fcmp olt float %123, 0.000000e+00
  %125 = select i1 %124, float 1.000000e+00, float -0.000000e+00
  %126 = fadd float %123, %125
  %127 = tail call float @llvm.amdgcn.ldexp.f32(float %126, i32 12)
  %128 = add nsw i32 %121, -12
  %129 = icmp ugt i32 %121, 24
  br i1 %129, label %119, label %130

130:                                              ; preds = %119, %113
  %131 = phi i32 [ %117, %113 ], [ %128, %119 ]
  %132 = phi float [ %116, %113 ], [ %127, %119 ]
  %133 = add nsw i32 %131, -11
  %134 = tail call float @llvm.amdgcn.ldexp.f32(float %132, i32 %133)
  %135 = tail call float @llvm.rint.f32(float %134)
  %136 = fsub float %134, %135
  %137 = fcmp olt float %136, 0.000000e+00
  %138 = select i1 %137, float 1.000000e+00, float -0.000000e+00
  %139 = fadd float %136, %138
  %140 = tail call float @llvm.amdgcn.ldexp.f32(float %139, i32 1)
  %141 = bitcast float %26 to i32
  %142 = and i32 %141, -2147483648
  %143 = bitcast float %140 to i32
  %144 = xor i32 %142, %143
  %145 = bitcast i32 %144 to float
  br label %150

146:                                              ; preds = %110
  %147 = fcmp oeq float %111, 2.000000e+00
  %148 = tail call float @llvm.copysign.f32(float 0.000000e+00, float %26)
  %149 = select i1 %147, float %148, float %26
  br label %150

150:                                              ; preds = %130, %146
  %151 = phi float [ %145, %130 ], [ %149, %146 ]
  %152 = tail call i1 @llvm.amdgcn.class.f32(float %26, i32 504)
  %153 = select i1 %152, float %151, float 0x7FF8000000000000
  %154 = fcmp contract une float %153, 0.000000e+00
  %155 = select contract i1 %154, float 1.000000e+00, float 0.000000e+00
  br label %169

156:                                              ; preds = %36
  %157 = sext i32 %35 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %0, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %160 = fmul contract float %28, 5.000000e+00
  %161 = fsub contract float %27, %160
  %162 = fdiv contract float %161, %24
  %163 = fcmp contract ult float %159, %162
  br i1 %163, label %169, label %164

164:                                              ; preds = %156
  %165 = fadd contract float %160, %27
  %166 = fdiv contract float %165, %24
  %167 = fcmp contract ole float %159, %166
  %168 = select contract i1 %167, float 1.000000e+00, float 0.000000e+00
  br label %169

169:                                              ; preds = %156, %164, %150
  %170 = phi contract float [ %155, %150 ], [ 0.000000e+00, %156 ], [ %168, %164 ]
  %171 = fcmp contract oeq float %170, 0.000000e+00
  %172 = sext i32 %35 to i64
  br i1 %171, label %173, label %176

173:                                              ; preds = %169
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !7
  br label %176

176:                                              ; preds = %173, %169, %90, %105, %97
  %177 = phi i64 [ %98, %97 ], [ %98, %105 ], [ %96, %90 ], [ %172, %169 ], [ %172, %173 ]
  %178 = phi float [ 0.000000e+00, %97 ], [ %109, %105 ], [ %95, %90 ], [ %170, %169 ], [ %175, %173 ]
  %179 = getelementptr inbounds float, float addrspace(1)* %1, i64 %177
  store float %178, float addrspace(1)* %179, align 4, !tbaa !7
  br label %180

180:                                              ; preds = %176, %32, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
